import 'package:flutter_bloc/flutter_bloc.dart';

class ExercisesCountCubit extends Cubit<int> {
  ExercisesCountCubit(count) : super(count);

  void addWidget() => emit(state + 1);
}
