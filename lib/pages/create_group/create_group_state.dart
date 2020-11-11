import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'create_group_state.freezed.dart';

@freezed
abstract class CreateGroupState with _$CreateGroupState {
  const factory CreateGroupState.standard({@required bool failed}) = _Standard;
  const factory CreateGroupState.submitting() = _Submitting;
  const factory CreateGroupState.success() = _Success;
}
