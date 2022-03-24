import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'movie.dart';
import 'movie_dto.dart';
import 'movies_provider.dart';

class HttpMoviesProvider implements MoviesProvider {
  final String _url;
  const HttpMoviesProvider(this._url);

  @override
  Future<List<Movie>> getMovies() async {
    final response = await get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return json.decode(response.body)
          .map<MovieDto>((json) => MovieDto.fromJson(json)).toList()
          .map<Movie>(_toMovie).toList();
    } else {
      debugPrint("Loading movies failed");
      return [];
    }
  }

  Movie _toMovie(MovieDto movieDto) {
    final rating = (double.tryParse(movieDto.imdbRating ?? "") ?? 0.0).toInt();
    return Movie(movieDto.title ?? "", rating, movieDto.images ?? [],movieDto.genre ?? "", movieDto.year ?? "");
  }
  
}
