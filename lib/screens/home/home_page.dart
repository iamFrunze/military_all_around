import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:military_all_around/screens/exercises/exercises_page.dart';
import 'package:military_all_around/screens/home/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: Scaffold(
          body: BlocBuilder<HomeCubit, int>(
            builder: (context, count) {
              switch (count) {
                case 0:
                  {
                    return ExercisesPage();
                  }
              }
            },
          ),
          bottomNavigationBar: BlocBuilder<HomeCubit, int>(
            builder: (context, count) {
              return BottomNavigationBar(
                currentIndex: count,
                onTap: context.watch<HomeCubit>().changePage,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.directions_run),
                      title: Text("Упраженения")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.history), title: Text("История")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.insert_chart), title: Text("График"))
                ],
              );
            },
          ),
        ));
  }
}
