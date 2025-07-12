import 'package:flutter/material.dart';
import 'package:http_and_provider/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:http_and_provider/models/movie_response.dart';

class MovieProvider extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  List<Movie> now_playing = [];

  final String _dominio = 'api.themoviedb.org';
  final String _segmento = '3/movie/now_playing';
  // ignore: non_constant_identifier_names
  final String _api_key = '5999788a963ea326c8ceb13a398a73a1';
  final String _language = 'es-MX';

  MovieProvider() {
    getMoviesUno();
  }

  Future<String> getMoviesNowPlaying() async {
    final url = Uri.https(_dominio, _segmento, {
      'api_key': _api_key,
      'language': _language,
    });

    final respuesta = await http.get(url);
    return respuesta.body;
  }

  void getMoviesUno() async {
    final response = await getMoviesNowPlaying();
    var jsonResponse = convert.jsonDecode(response) as Map<String, dynamic>;
    final movieResponse = MovieResponse.fromJson(jsonResponse);
    //now_playing = [ ...now_playing, ...movieResponse.results ];
    now_playing = movieResponse.results;

    notifyListeners();
  }
}
