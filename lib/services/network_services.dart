import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tmdb_app/models/movie.dart';
import 'package:tmdb_app/utils/app_utils.dart';

class NetworkServices {
  static Future<List<Movie>> getTopRatedMovies() async {
    List<Movie> results = <Movie>[];
    String logPrefix = "Fetching top rated movies log - ";
    try {
      Response response = await Dio()
          .get(AppUtils.tmdbBaseUrl + "/top_rated?" + AppUtils.tmdbApiKey);
      log(logPrefix + "${response.statusCode}");
      log(logPrefix + "${response.data['results'].length}");
      if (response.statusCode == 200) {
        if (response.data != null) {
          response.data['results'].forEach((result) {
            results.add(Movie.fromJson(result));
            log(logPrefix + "${result['poster_path']}");
          });
        }
      }
    } catch (error) {
      log("$logPrefix $error");
    }
    return results;
  }
}
