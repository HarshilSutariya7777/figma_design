import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController pay = TextEditingController();
  late Razorpay razorpay;
  @override
  void initState() {
    super.initState();
    razorpay = Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  void openChakOut() {
    var options = {
      "key": "rzp_test_Jdp3vWuNRIoKS9",
      "amount": num.parse(pay.text) * 100,
      "name": "Razorpay Demo",
      "description": "payment for the randrom product",
      "prefill": {
        "contact": "9574990608",
        "email": "harshilsutariya100@gmail.com",
      },
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void handlePaymentSuccess() {
    debugPrint("payment succcessfully");
  }

  void handlerPaymentError() {
    debugPrint("payment Erorr");
  }

  void handlerExternalWallet() {
    debugPrint("payment done");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextFormField(
            controller: pay,
            decoration: InputDecoration(
                hintText: "Enter The Amount",
                labelText: "Amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          ElevatedButton(
            onPressed: openChakOut,
            child: const Text("pay"),
          )
        ]),
      ),
    );
  }
}
