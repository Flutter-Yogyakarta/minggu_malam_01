import 'package:flutter/material.dart';
import 'package:movie_info/model/model.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    Key key, this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
          padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          
          Image.network(
              'https://image.tmdb.org/t/p/w130_and_h195_bestv2/${movie.posterPath}')
        ],
      ),
    ));
  }
}
