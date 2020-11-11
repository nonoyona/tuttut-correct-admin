import 'package:correct/logic/dataobjects/group_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'group_overview_state.freezed.dart';

@freezed
abstract class GroupOverviewData implements _$GroupOverviewData {
  const GroupOverviewData._();
  const factory GroupOverviewData() = _GroupOverviewData;
}

@freezed
abstract class GroupOverviewState with _$GroupOverviewState {
  const factory GroupOverviewState.loading() = _Loading;
  const factory GroupOverviewState.loaded(List<GroupInfo> groups) = _Loaded;
}
