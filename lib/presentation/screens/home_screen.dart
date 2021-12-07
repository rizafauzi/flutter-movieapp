import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/providers/movie_provider.dart';
import 'package:movie_app/data/repositories/movie_repository.dart';
import 'package:movie_app/logic/blocs/movie/movie_bloc.dart';
import 'package:movie_app/presentation/widgets/bottom_navbar.dart';
import 'package:movie_app/presentation/widgets/movie_section.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieRepository repository = MovieRepository(provider: MovieProvider());
  late MovieBloc _movieBloc;

  final List<Map<String, String>> movies = [
    {'title': 'Top DCEU Movies', 'keyword': 'Superman'},
    {'title': 'Top Netflix Movies', 'keyword': 'avengers'},
    {'title': 'Top MCU Movies', 'keyword': 'ironman'},
    {'title': 'Your Favorite', 'keyword': 'wonder woman'},
    {'title': 'Top Action Movies', 'keyword': 'jumanji'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Hello'),
                            const Text(
                              'Riza Fauzi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text('Hi, Riza.'),
                  ],
                ),
              ),
              ...movies
                  .map(
                    (data) => BlocProvider(
                      create: (_) => MovieBloc(),
                      child: MovieSection(
                        keyword: data['keyword'] as String,
                        title: data['title'] as String,
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
