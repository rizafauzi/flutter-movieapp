part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class FetchMovieList extends MovieEvent {
  final String keyword;

  const FetchMovieList(this.keyword);

  @override
  List<Object> get props => [];
}

class FetchMovieById extends MovieEvent {
  final String imdbId;

  const FetchMovieById(this.imdbId);

  @override
  List<Object> get props => [];
}
