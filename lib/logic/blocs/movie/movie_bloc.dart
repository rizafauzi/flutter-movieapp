import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/data/models/movie_detail.dart';
import 'package:movie_app/data/providers/movie_provider.dart';
import 'package:movie_app/data/repositories/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository = MovieRepository(provider: MovieProvider());

  @override
  MovieState get initialState => MovieEmpty();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is FetchMovieList) {
      yield MovieLoading();
      try {
        final List<Movie> movies =
            await repository.fetchMovieList(event.keyword);
        yield MovieLoaded(movieList: movies);
      } catch (_) {
        const MovieError('Oops... Something happened');
      }
    }
    if (event is FetchMovieById) {
      yield MovieDetailLoading();
      try {
        final MovieDetail movie = await repository.fetchMovieById(event.imdbId);

        yield MovieDetailLoaded(movie: movie);
      } catch (_) {
        const MovieDetailError('Oops... Something happened');
      }
    }
  }
}
