import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  Future getpost() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("Details").get();
    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(),
      body: FutureBuilder(
        future: getpost(),
        builder: (context, snapshot) => ListView.builder(
            itemCount: snapshot.data.toString().length,
            itemBuilder: (context, index) => const ListTile(
                // leading: Text(snapshot.data[index]['id']),
                // title: Text(snapshot.data[index]['name']),
                )),
      ),
    );
  }
}
