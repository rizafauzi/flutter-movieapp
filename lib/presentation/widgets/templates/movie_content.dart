import 'package:flutter/material.dart';

import 'package:movie_app/data/models/movie_detail.dart';
import 'package:movie_app/presentation/widgets/atoms/actor_avatar.dart';
import 'package:movie_app/presentation/widgets/atoms/label_field.dart';
import 'package:movie_app/presentation/widgets/atoms/rating_badge.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieDetail movie;

  List<String> get getActors => movie.actors.split(',').toList();

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
                    colors: [
                      Colors.black,
                      Colors.black,
                      Colors.transparent,
                    ],
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
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      movie.genre,
                      style: const TextStyle(
                        // color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: movie.ratings
                          .map(
                            (e) => TextBadge(
                              label: e.source,
                              value: e.value,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Plot',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    movie.plot,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Divider(color: Colors.white30),
                const Text(
                  'Cast',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                    itemCount: getActors.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ActorAvatar(actorName: getActors[index]);
                    },
                  ),
                ),
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
                LabelField('Meta Score', movie.metascore),
              ],
            ),
          )
        ],
      ),
    );
  }
}
