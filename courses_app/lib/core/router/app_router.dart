import 'package:courses_app/buisness_logic/auth/signin_bloc/signin_bloc.dart';
import 'package:courses_app/buisness_logic/welcome_bloc/welcome_bloc.dart';
import 'package:courses_app/core/router/app_routes_names.dart';
import 'package:courses_app/presentation/auth/signin/signin_screen.dart';
import 'package:courses_app/presentation/homepage/homepage.dart';
import 'package:courses_app/presentation/homepage/homepage_block/app_bloc.dart';
import 'package:courses_app/presentation/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter extends Bloc {
  AppRouter(super.initialState);
  Route? onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case AppRoutesNames.welcome:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => WelcomeBloc(),
            child: const WelcomeScreen(),
          ),
        );
      case AppRoutesNames.homepage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AppBloc(),
            child: const Homepage(),
          ),
        );
      case AppRoutesNames.signin:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SigninBloc(),
                  child: SigninScreen(),
                ));
      default:
        return null;
    }
  }
}
