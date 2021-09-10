import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_app/models/movie.dart';
import 'package:tmdb_app/services/network_services.dart';

class MovieProvider extends StateNotifier<List<Movie>> {
  MovieProvider() : super(<Movie>[]) {
    _getMovies();
  }

  bool _isGridView = false;

  bool get isGridView => _isGridView;

  changeLayout() {
    _isGridView = true;
  }

  _getMovies() async {
    state = await NetworkServices.getTopRatedMovies();
  }
}

final movieProvider = StateNotifierProvider((ref) => MovieProvider());
