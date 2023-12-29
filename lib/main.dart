import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/src/modules/home/home_bloc.dart';
import 'package:test_project/src/modules/screens/home_screen.dart';
import 'package:test_project/src/observer.dart';

void main() {
  Bloc.observer = DataObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => HomeBloc()..add(FetchDataEvent()),
        child: const HomeScreen(),
      ),
    );
  }
}
