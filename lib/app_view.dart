import 'dart:async';

import 'package:eriell_test/domain/authentication_bloc/authentication_bloc.dart';
import 'package:eriell_test/presentation/screens/auth/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:eriell_test/presentation/screens/auth/views/welcome.dart';
import 'package:eriell_test/presentation/screens/home/splash.dart';
import 'package:eriell_test/presentation/screens/home/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppView extends StatefulWidget {
  const MyAppView({super.key});

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    _startSplashTimer();
  }

  void _startSplashTimer() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSplash) {
      return const Directionality(
        textDirection: TextDirection.ltr,
        child: SplashScreen(),
      );
    }
    return Material(
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: ((context, state) {
          if (state.status == AuthenticationStatus.unknown) {
            // While the authentication status is being determined, show a loading indicator
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == AuthenticationStatus.authenticated) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => SignInBloc(
                      context.read<AuthenticationBloc>().userRepository),
                ),
              ],
              child: const TabsScreen(),
            );
          } else {
            return const WelcomeScreen();
          }
        }),
      ),
    );
  }
}
