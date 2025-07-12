// To parse this JSON data, do
//
//     final movieResponse = movieResponseFromJson(jsonString);

import 'dart:convert';
import 'package:http_and_provider/models/movie.dart';

MovieResponse movieResponseFromJson(String str) =>
    MovieResponse.fromJson(json.decode(str));

//String movieResponseToJson(MovieResponse data) => json.encode(data.toJson());

class MovieResponse {
  final String? dates;
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MovieResponse({
    this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
    dates: null,
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );
}
