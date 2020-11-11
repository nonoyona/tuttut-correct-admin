import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'points.freezed.dart';
part 'points.g.dart';

@freezed
abstract class Points implements _$Points {
  const Points._();
  const factory Points({
    @required int reached,
    int reachable,
  }) = _Points;
  factory Points.fromJson(Map<String, dynamic> json) => _$PointsFromJson(json);

  String get asString =>
      reachable != null ? "$reached/$reachable" : reached.toString();
}
