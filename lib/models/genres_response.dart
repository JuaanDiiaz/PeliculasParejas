import 'dart:convert';

import 'package:peliculas/models/models.dart';

class GenresResponse {
  List<Genre> genres;

  GenresResponse({
    required this.genres,
  });

  factory GenresResponse.fromRawJson(String str) =>
      GenresResponse.fromJson(json.decode(str));

  factory GenresResponse.fromJson(Map<String, dynamic> json) => GenresResponse(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );
}
