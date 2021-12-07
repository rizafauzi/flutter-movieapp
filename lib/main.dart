// @dart=2.9
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/router/app_route.dart';
import 'package:movie_app/presentation/screens/home_screen.dart';
import 'package:movie_app/presentation/screens/movie_screen.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
            ),
      ),
      initialRoute: '/profile',
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
