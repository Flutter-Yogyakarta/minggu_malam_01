import 'package:flutter/material.dart';
import 'package:movie_info/model/model.dart';
import 'package:movie_info/repository/repository.dart';
import 'package:movie_info/widget/widget.dart';

class MovieTrendListPage extends StatefulWidget {
  @override
  _MovieTrendListPageState createState() => _MovieTrendListPageState();
}

class _MovieTrendListPageState extends State<MovieTrendListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Trend'),
      ),
      body: Container(
        child: FutureBuilder<MovieList>(
          future: MovieRepository().fetchMovieTrend(),
          builder: (context, movieListSnapshot) {
            if (!movieListSnapshot.hasData) {
              return LinearProgressIndicator();
            }
            return Container(
              child: ListView.builder(
                itemCount: movieListSnapshot.data.results.length,
                itemBuilder: (context, index) {
                  return  MovieCard(movie: movieListSnapshot.data.results[index],);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

