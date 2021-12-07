import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/models/movie_detail.dart';
import 'package:movie_app/logic/blocs/movie/movie_bloc.dart';
import 'package:movie_app/presentation/widgets/atoms/label_field.dart';
import 'package:movie_app/presentation/widgets/atoms/text_badge.dart';

class MovieScreen extends StatefulWidget {
  final String imdbId;
  static const routeName = '/movie';
  MovieScreen(this.imdbId);

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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: null,
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

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieDetail movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ShaderMask(
                shaderCallback: (rectangle) {
                  return const LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(
                    Rect.fromLTRB(
                      0,
                      0,
                      rectangle.width,
                      rectangle.height,
                    ),
                  );
                },
                blendMode: BlendMode.dstIn,
                child: Image.network(
                  movie.poster,
                  height: 500,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/error_image.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      movie.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      movie.genre,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: movie.ratings
                          .map((e) => TextBadge(label: e.value))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white30),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(movie.plot),
                const Divider(color: Colors.white30),
                LabelField('Director', movie.director),
                LabelField('Awards', movie.awards),
                LabelField('Box Office', movie.boxOffice),
                LabelField('DVD', movie.dvd),
                LabelField('Awards', movie.awards),
                LabelField('IMDB Votes', movie.imdbVotes),
                LabelField('IMDB Rating', movie.imdbRating),
                LabelField('Language', movie.language),
                LabelField('Country', movie.country),
                LabelField('Country', movie.country),
              ],
            ),
          )
        ],
      ),
    );
  }
}
