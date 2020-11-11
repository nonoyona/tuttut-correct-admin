import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'group_info.freezed.dart';
part 'group_info.g.dart';

@freezed
abstract class GroupInfo implements _$GroupInfo {
  const GroupInfo._();
  const factory GroupInfo({
    @required String name,
    @required String id,
    @required String userId,
  }) = _GroupInfo;
  factory GroupInfo.fromJson(Map<String, dynamic> json) =>
      _$GroupInfoFromJson(json);
}
