// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'create_group_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CreateGroupStateTearOff {
  const _$CreateGroupStateTearOff();

// ignore: unused_element
  _Standard standard({@required bool failed}) {
    return _Standard(
      failed: failed,
    );
  }

// ignore: unused_element
  _Submitting submitting() {
    return const _Submitting();
  }

// ignore: unused_element
  _Success success() {
    return const _Success();
  }
}

/// @nodoc
// ignore: unused_element
const $CreateGroupState = _$CreateGroupStateTearOff();

/// @nodoc
mixin _$CreateGroupState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result standard(bool failed),
    @required Result submitting(),
    @required Result success(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result standard(bool failed),
    Result submitting(),
    Result success(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result standard(_Standard value),
    @required Result submitting(_Submitting value),
    @required Result success(_Success value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result standard(_Standard value),
    Result submitting(_Submitting value),
    Result success(_Success value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $CreateGroupStateCopyWith<$Res> {
  factory $CreateGroupStateCopyWith(
          CreateGroupState value, $Res Function(CreateGroupState) then) =
      _$CreateGroupStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CreateGroupStateCopyWithImpl<$Res>
    implements $CreateGroupStateCopyWith<$Res> {
  _$CreateGroupStateCopyWithImpl(this._value, this._then);

  final CreateGroupState _value;
  // ignore: unused_field
  final $Res Function(CreateGroupState) _then;
}

/// @nodoc
abstract class _$StandardCopyWith<$Res> {
  factory _$StandardCopyWith(_Standard value, $Res Function(_Standard) then) =
      __$StandardCopyWithImpl<$Res>;
  $Res call({bool failed});
}

/// @nodoc
class __$StandardCopyWithImpl<$Res> extends _$CreateGroupStateCopyWithImpl<$Res>
    implements _$StandardCopyWith<$Res> {
  __$StandardCopyWithImpl(_Standard _value, $Res Function(_Standard) _then)
      : super(_value, (v) => _then(v as _Standard));

  @override
  _Standard get _value => super._value as _Standard;

  @override
  $Res call({
    Object failed = freezed,
  }) {
    return _then(_Standard(
      failed: failed == freezed ? _value.failed : failed as bool,
    ));
  }
}

/// @nodoc
class _$_Standard with DiagnosticableTreeMixin implements _Standard {
  const _$_Standard({@required this.failed}) : assert(failed != null);

  @override
  final bool failed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateGroupState.standard(failed: $failed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreateGroupState.standard'))
      ..add(DiagnosticsProperty('failed', failed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Standard &&
            (identical(other.failed, failed) ||
                const DeepCollectionEquality().equals(other.failed, failed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failed);

  @override
  _$StandardCopyWith<_Standard> get copyWith =>
      __$StandardCopyWithImpl<_Standard>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result standard(bool failed),
    @required Result submitting(),
    @required Result success(),
  }) {
    assert(standard != null);
    assert(submitting != null);
    assert(success != null);
    return standard(failed);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result standard(bool failed),
    Result submitting(),
    Result success(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (standard != null) {
      return standard(failed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result standard(_Standard value),
    @required Result submitting(_Submitting value),
    @required Result success(_Success value),
  }) {
    assert(standard != null);
    assert(submitting != null);
    assert(success != null);
    return standard(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result standard(_Standard value),
    Result submitting(_Submitting value),
    Result success(_Success value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (standard != null) {
      return standard(this);
    }
    return orElse();
  }
}

abstract class _Standard implements CreateGroupState {
  const factory _Standard({@required bool failed}) = _$_Standard;

  bool get failed;
  _$StandardCopyWith<_Standard> get copyWith;
}

/// @nodoc
abstract class _$SubmittingCopyWith<$Res> {
  factory _$SubmittingCopyWith(
          _Submitting value, $Res Function(_Submitting) then) =
      __$SubmittingCopyWithImpl<$Res>;
}

/// @nodoc
class __$SubmittingCopyWithImpl<$Res>
    extends _$CreateGroupStateCopyWithImpl<$Res>
    implements _$SubmittingCopyWith<$Res> {
  __$SubmittingCopyWithImpl(
      _Submitting _value, $Res Function(_Submitting) _then)
      : super(_value, (v) => _then(v as _Submitting));

  @override
  _Submitting get _value => super._value as _Submitting;
}

/// @nodoc
class _$_Submitting with DiagnosticableTreeMixin implements _Submitting {
  const _$_Submitting();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateGroupState.submitting()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CreateGroupState.submitting'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Submitting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result standard(bool failed),
    @required Result submitting(),
    @required Result success(),
  }) {
    assert(standard != null);
    assert(submitting != null);
    assert(success != null);
    return submitting();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result standard(bool failed),
    Result submitting(),
    Result success(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (submitting != null) {
      return submitting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result standard(_Standard value),
    @required Result submitting(_Submitting value),
    @required Result success(_Success value),
  }) {
    assert(standard != null);
    assert(submitting != null);
    assert(success != null);
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result standard(_Standard value),
    Result submitting(_Submitting value),
    Result success(_Success value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (submitting != null) {
      return submitting(this);
    }
    return orElse();
  }
}

abstract class _Submitting implements CreateGroupState {
  const factory _Submitting() = _$_Submitting;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> extends _$CreateGroupStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;
}

/// @nodoc
class _$_Success with DiagnosticableTreeMixin implements _Success {
  const _$_Success();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateGroupState.success()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CreateGroupState.success'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result standard(bool failed),
    @required Result submitting(),
    @required Result success(),
  }) {
    assert(standard != null);
    assert(submitting != null);
    assert(success != null);
    return success();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result standard(bool failed),
    Result submitting(),
    Result success(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result standard(_Standard value),
    @required Result submitting(_Submitting value),
    @required Result success(_Success value),
  }) {
    assert(standard != null);
    assert(submitting != null);
    assert(success != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result standard(_Standard value),
    Result submitting(_Submitting value),
    Result success(_Success value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CreateGroupState {
  const factory _Success() = _$_Success;
}
