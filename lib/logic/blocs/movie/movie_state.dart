part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

// Movies ======================================================

class MovieEmpty extends MovieState {}

class MovieLoading extends MovieState {}

class MovieError extends MovieState {
  final String message;

  const MovieError(this.message);
}

class MovieLoaded extends MovieState {
  final List<Movie> movieList;

  const MovieLoaded({required this.movieList});

  @override
  List<Object> get props => [movieList];
}

// Movie Detail ================================================

class MovieDetailEmpty extends MovieState {}

class MovieDetailLoading extends MovieState {}

class MovieDetailError extends MovieState {
  final String message;

  const MovieDetailError(this.message);
}

class MovieDetailLoaded extends MovieState {
  final MovieDetail movie;

  const MovieDetailLoaded({required this.movie});

  @override
  List<Object> get props => [movie];
}
