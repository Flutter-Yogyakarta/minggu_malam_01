import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_info/model/model.dart';

class MovieRepository {
  Future<MovieList> fetchMovieTrend() async {
    final String url = 'https://api.themoviedb.org/3/trending/movie/week?api_key=173226575f4698490a089d9716dca8b9';
    var respon = await http.get(url);
    // MovieList movieList = MovieList.fromMap(json.decode(respon.body));

    MovieList movieList = movieListFromJson(respon.body);

    return movieList;
  }
}
