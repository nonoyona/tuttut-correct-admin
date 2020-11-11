import 'package:correct/logic/services/api_service.dart';
import 'package:correct/logic/services/group_service.dart';
import 'package:correct/pages/create_group/create_group_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupLogic extends Cubit<CreateGroupState> {
  CreateGroupLogic() : super(CreateGroupState.standard(failed: false));

  Future onSubmit(String name) async {
    if (state.maybeWhen(
      orElse: () => true,
      standard: (_) => false,
    )) return;
    if (name.isEmpty) {
      emit(CreateGroupState.standard(failed: true));
      emit(CreateGroupState.standard(failed: false));
      return;
    }
    emit(CreateGroupState.submitting());
    final success = await GroupService.instance.createGroup(name);
    if (success) {
      emit(CreateGroupState.success());
    } else {
      emit(CreateGroupState.standard(failed: true));
      emit(CreateGroupState.standard(failed: false));
    }
  }

  static CreateGroupLogic of(BuildContext context) =>
      BlocProvider.of<CreateGroupLogic>(context);
}
