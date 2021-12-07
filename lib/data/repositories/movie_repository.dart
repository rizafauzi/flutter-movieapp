import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/data/models/movie_detail.dart';
import 'package:movie_app/data/providers/movie_provider.dart';

class MovieRepository {
  final MovieProvider provider;

  MovieRepository({required this.provider});

  Future<List<Movie>> fetchMovieList(keyword) async {
    return await provider.getMovieList(keyword);
  }

  Future<MovieDetail> fetchMovieById(id) async {
    return await provider.getMovieById(id);
  }
}
