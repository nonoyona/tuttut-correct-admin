import 'package:correct/logic/services/api_service.dart';
import 'package:correct/logic/services/exercise_service.dart';
import 'package:correct/pages/create_exercise/create_exercise_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateExerciseLogic extends Cubit<CreateExerciseState> {
  final String groupId;
  CreateExerciseLogic({@required this.groupId})
      : super(CreateExerciseState.standard(failed: false));

  Future onSubmit(String name) async {
    if (state.maybeWhen(
      orElse: () => true,
      standard: (_) => false,
    )) return;
    if (name.isEmpty) {
      emit(CreateExerciseState.standard(failed: true));
      emit(CreateExerciseState.standard(failed: false));
      return;
    }
    emit(CreateExerciseState.submitting());
    final success =
        await ExerciseService.instance.createExercise(name, groupId);
    if (success) {
      emit(CreateExerciseState.success());
    } else {
      emit(CreateExerciseState.standard(failed: true));
      emit(CreateExerciseState.standard(failed: false));
    }
  }

  static CreateExerciseLogic of(BuildContext context) =>
      BlocProvider.of<CreateExerciseLogic>(context);
}
