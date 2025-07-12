import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:http_and_provider/models/movie.dart';
import 'package:http_and_provider/providers/movie_provider.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Como consumir el provider
    final movieProvider = Provider.of<MovieProvider>(context);

    List<Movie> movies = movieProvider.now_playing;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Movie Card Swiper')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Swiper(
              itemCount: movies.length,
              itemHeight: size.height * 0.5,
              itemWidth: 300,
              layout: SwiperLayout.STACK,
              itemBuilder: (context, i) {
                return ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.png'),
                    image: NetworkImage(movies[i].movieBackdropPath),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),

            SizedBox(height: 40),
            NewWidget(size: size, movies: movies),
            //NewWidget(size: size, movies: movies),
            //NewWidget(size: size, movies: movies),
            //NewWidget(size: size, movies: movies),
            //NewWidget(size: size, movies: movies),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({super.key, required this.size, required this.movies});

  final Size size;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      //color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: 120,
            height: 100,
            //color: Colors.amber,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: FadeInImage(
                    width: 120,
                    height: 180,
                    placeholder: AssetImage('assets/no-image.png'),
                    //image: NetworkImage('https://picsum.photos/250?image=9')
                    image: NetworkImage(movies[index].movieBackdropPath),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  movies[index].title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
