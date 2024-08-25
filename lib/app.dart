import 'package:eriell_test/app_view.dart';
import 'package:eriell_test/domain/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade200,
          onSurface: Colors.black,
          primary: const Color.fromRGBO(214, 167, 32, 1),
          //const Color.fromRGBO(4, 103, 172, 1),
          onPrimary: Colors.white,
          onSecondaryContainer: Colors.grey.shade400,
          onPrimaryContainer: const Color.fromRGBO(4, 103, 172, 1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(userRepository: userRepository),
        child: const MyAppView(),
      ),
    );
  }
}
