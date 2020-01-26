import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:movie_info/model/model.dart';

class MovieRepository {
  MovieRepository._();

  static MovieRepository get instace => MovieRepository._();

  Future<MovieList> fetchMovieTrend() async {
    // bool _certificateCheck(X509Certificate cert, String host, int port) => true;
    // var ioClient = new HttpClient()..badCertificateCallback = _certificateCheck;
    // ioClient.get();
    final String url = 'https://api.themoviedb.org/3/trending/movie/week?api_key=173226575f4698490a089d9716dca8b9';
    var respon = await http.get(url);
    // MovieList movieList = MovieList.fromMap(json.decode(respon.body));

    MovieList movieList = movieListFromJson(respon.body);

    return movieList;
  }
}
