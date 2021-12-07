import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/models/movie_detail.dart';
import 'package:movie_app/logic/blocs/movie/movie_bloc.dart';
import 'package:movie_app/presentation/widgets/atoms/actor_avatar.dart';
import 'package:movie_app/presentation/widgets/atoms/label_field.dart';
import 'package:movie_app/presentation/widgets/atoms/rating_badge.dart';
import 'package:movie_app/presentation/widgets/templates/movie_content.dart';

class MovieScreen extends StatefulWidget {
  final String imdbId;
  static const routeName = '/movie';
  const MovieScreen(this.imdbId, {Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late MovieBloc _movieBloc;

  @override
  void initState() {
    super.initState();
    _movieBloc = MovieBloc();
    _movieBloc.add(FetchMovieById(widget.imdbId));
  }

  @override
  void dispose() {
    super.dispose();
    _movieBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0x77000000),
          ),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0x77000000),
            ),
            child: const IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: null,
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: BlocBuilder<MovieBloc, MovieState>(
        bloc: _movieBloc,
        builder: (context, state) {
          if (state is MovieDetailError) {
            return const Text('error');
          }
          if (state is MovieDetailLoaded) {
            return MovieDetailContent(movie: state.movie);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
