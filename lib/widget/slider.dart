import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

List imagemovie = [
  "https://www.mmppicture.co.in/wp-content/uploads/2022/03/The-Kashmir-Files-Poster-1.jpg",
  "https://w0.peakpx.com/wallpaper/720/8/HD-wallpaper-vijay-master-movie-poster.jpg",
  "https://cdn.wallpapersafari.com/2/24/7PlZsw.jpg",
  "https://media.99images.com/photos/movies-tv/kgf-chapter-2/kgf-chapter-2-movie-latest-hd-photos-posters-wallpapers-926m.jpg",
  "https://www.mixindia.com/wp-content/uploads/2022/02/Radhe-Shyam-Telugu-Movie-Poster-1-scaled.jpg",
  "https://2.bp.blogspot.com/-LdWTQq-ESsw/V09PECp9wyI/AAAAAAAAIjc/IURWm7lcBUQImIA5b-I53Gj1n8iCmskpQCLcB/w680/Dishoom.JPG",
  "https://i.ytimg.com/vi/_e9y729xeck/maxresdefault.jpg"
];

class Slider1 extends StatelessWidget {
  const Slider1({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
        width: 320,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Image.network(
          imagemovie[itemIndex],
          fit: BoxFit.cover,
        ),
      ),
      options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          viewportFraction: 0.8,
          height: 230,
          aspectRatio: 16 / 9,
          enableInfiniteScroll: true),
    );
  }
}
