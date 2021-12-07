import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/logic/blocs/movie/movie_bloc.dart';
import 'package:movie_app/presentation/screens/home_screen.dart';
import 'package:movie_app/presentation/screens/movie_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case MovieScreen.routeName:
        String imdbId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MovieBloc(),
            child: MovieScreen(imdbId),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
