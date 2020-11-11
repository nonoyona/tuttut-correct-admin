import 'package:correct/logic/services/api_service.dart';
import 'package:correct/logic/services/group_service.dart';
import 'package:correct/pages/group_overview/group_overview_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupOverviewLogic extends Cubit<GroupOverviewState> {
  GroupOverviewLogic() : super(GroupOverviewState.loading()) {
    GroupService.instance.listenToGroupInfos().listen((event) {
      emit(GroupOverviewState.loaded(event));
    });
  }
}
