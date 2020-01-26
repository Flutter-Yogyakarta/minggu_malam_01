import 'package:flutter/material.dart';
import 'package:movie_info/model/model.dart';
import 'package:movie_info/repository/repository.dart';
import 'package:movie_info/widget/widget.dart';

class MovieTrendListPage extends StatefulWidget {
  @override
  _MovieTrendListPageState createState() => _MovieTrendListPageState();
}

class _MovieTrendListPageState extends State<MovieTrendListPage> {
  MovieRepository movieRepository = MovieRepository.instace;

  bool isLoading = true;
  List<Movie> movies;

  @override
  void initState() {
    super.initState();
    _fetchMovieLiest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Trend'),
      ),
      body: Container(
        child: isLoading
            ? LinearProgressIndicator()
            : Container(
                child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(
                      movie: movies[index],
                    );
                  },
                ),
              ),
      ),
    );
  }

  _fetchMovieLiest() async {
    var result = await movieRepository.fetchMovieTrend();
    setState(() {
      movies = result.results;
      isLoading = false;
    });
  }
}
