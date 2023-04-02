import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midjourney/bloc/callery/gallery_cubit.dart';
import 'package:midjourney/bloc/menu/menu_cubit.dart';
import 'package:midjourney/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MenuCubit()),
        BlocProvider(create: (context) => GalleryCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MidJourney',
        theme: ThemeData(
          // brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0
          ),
        ),
        home: const HomeScreen()
      ),
    );
  }
}