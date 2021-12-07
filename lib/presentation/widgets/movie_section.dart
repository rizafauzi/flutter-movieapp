import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/logic/blocs/movie/movie_bloc.dart';
import 'package:movie_app/presentation/widgets/movie_card.dart';

class MovieSection extends StatelessWidget {
  final String keyword;
  final String title;

  const MovieSection({
    Key? key,
    required this.title,
    required this.keyword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('See All'),
            ],
          ),
        ),
        SizedBox(
            height: 200,
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is MovieEmpty) {
                  BlocProvider.of<MovieBloc>(context)
                      .add(FetchMovieList(keyword));
                  return const SizedBox();
                }
                if (state is MovieLoaded) {
                  return ListView.builder(
                    itemCount: state.movieList.length,
                    padding: EdgeInsets.only(left: 15),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movie: state.movieList[index],
                      );
                    },
                  );
                }
                if (state is MovieError) {
                  return Text('Error...');
                }
                return Text('Loading...');
              },
            )),
      ],
    ));
  }
}
