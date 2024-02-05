import 'package:courses_app/buisness_logic/auth/signin_bloc/signin_bloc.dart';
import 'package:courses_app/buisness_logic/auth/signup_bloc/signup_bloc.dart';
import 'package:courses_app/buisness_logic/mainpage/mainpage_bloc/mainpage_bloc.dart';
import 'package:courses_app/buisness_logic/welcome_bloc/welcome_bloc.dart';
import 'package:courses_app/core/router/app_routes_names.dart';
import 'package:courses_app/core/router/middleware.dart';
import 'package:courses_app/presentation/screens/auth/signin/signin_screen.dart';
import 'package:courses_app/presentation/screens/auth/signup/signup_screen.dart';
import 'package:courses_app/presentation/screens/mainpage/mainpage.dart';
import 'package:courses_app/presentation/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter extends Bloc {
  AppRouter(super.initialState);
  Route? onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    String? routeName = AppMiddleWare.middlleware(routeSettings.name);
    switch (routeName) {
      case AppRoutesNames.welcome:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => WelcomeBloc(),
            child: const WelcomeScreen(),
          ),
        );
      // case AppRoutesNames.homepage:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => AppBloc(),
      //       child: const Homepage(),
      //     ),
      //   );
      case AppRoutesNames.signin:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SigninBloc(),
                  child: SigninScreen(),
                ));
      case AppRoutesNames.signup:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignupBloc(),
            child: SignupScreen(),
          ),
        );
      case AppRoutesNames.mainPage:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => MainpageBloc(),
                  child: const MainPage(),
                ));
      default:
        return null;
    }
  }
}
