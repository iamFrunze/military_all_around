import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:military_all_around/screens/exercises/exercises_count_cubit.dart';

class ExercisesPage extends StatefulWidget {
  @override
  _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children;
    return BlocProvider(
        create: (context) => ExercisesCountCubit(1),
        child: Scaffold(body: Center(
          child: Container(
            child: BlocBuilder<ExercisesCountCubit, int>(
              builder: (context, count) {
                print("COUNT $count");
                children = List.generate(count, (index) => CardExercise());

                return ListView(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: children);
              },
            ),
          ),
        ), floatingActionButton: BlocBuilder<ExercisesCountCubit, int>(
          builder: (context, state) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                context.read<ExercisesCountCubit>().addWidget();
              },
            );
          },
        )));
  }
}

class CardExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        borderOnForeground: true,
        elevation: 8,
        child: Column(
          children: [
            Text("Выберите упражнение"),
            dropDownList(),
            Text("Выберите результат"),
            dropDownList()
          ],
        ),
      ),
    );
  }

  Widget dropDownList() {
    return DropdownButton(
      items: <String>["ASD", "ASDdsa", "asdasd"].map((String value) {
        return new DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}
