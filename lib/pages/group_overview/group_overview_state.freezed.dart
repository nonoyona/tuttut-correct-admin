// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'group_overview_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GroupOverviewDataTearOff {
  const _$GroupOverviewDataTearOff();

// ignore: unused_element
  _GroupOverviewData call() {
    return const _GroupOverviewData();
  }
}

/// @nodoc
// ignore: unused_element
const $GroupOverviewData = _$GroupOverviewDataTearOff();

/// @nodoc
mixin _$GroupOverviewData {}

/// @nodoc
abstract class $GroupOverviewDataCopyWith<$Res> {
  factory $GroupOverviewDataCopyWith(
          GroupOverviewData value, $Res Function(GroupOverviewData) then) =
      _$GroupOverviewDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$GroupOverviewDataCopyWithImpl<$Res>
    implements $GroupOverviewDataCopyWith<$Res> {
  _$GroupOverviewDataCopyWithImpl(this._value, this._then);

  final GroupOverviewData _value;
  // ignore: unused_field
  final $Res Function(GroupOverviewData) _then;
}

/// @nodoc
abstract class _$GroupOverviewDataCopyWith<$Res> {
  factory _$GroupOverviewDataCopyWith(
          _GroupOverviewData value, $Res Function(_GroupOverviewData) then) =
      __$GroupOverviewDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$GroupOverviewDataCopyWithImpl<$Res>
    extends _$GroupOverviewDataCopyWithImpl<$Res>
    implements _$GroupOverviewDataCopyWith<$Res> {
  __$GroupOverviewDataCopyWithImpl(
      _GroupOverviewData _value, $Res Function(_GroupOverviewData) _then)
      : super(_value, (v) => _then(v as _GroupOverviewData));

  @override
  _GroupOverviewData get _value => super._value as _GroupOverviewData;
}

/// @nodoc
class _$_GroupOverviewData extends _GroupOverviewData
    with DiagnosticableTreeMixin {
  const _$_GroupOverviewData() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GroupOverviewData()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'GroupOverviewData'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GroupOverviewData);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _GroupOverviewData extends GroupOverviewData {
  const _GroupOverviewData._() : super._();
  const factory _GroupOverviewData() = _$_GroupOverviewData;
}

/// @nodoc
class _$GroupOverviewStateTearOff {
  const _$GroupOverviewStateTearOff();

// ignore: unused_element
  _Loading loading() {
    return const _Loading();
  }

// ignore: unused_element
  _Loaded loaded(List<GroupInfo> groups) {
    return _Loaded(
      groups,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GroupOverviewState = _$GroupOverviewStateTearOff();

/// @nodoc
mixin _$GroupOverviewState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result loaded(List<GroupInfo> groups),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result loaded(List<GroupInfo> groups),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $GroupOverviewStateCopyWith<$Res> {
  factory $GroupOverviewStateCopyWith(
          GroupOverviewState value, $Res Function(GroupOverviewState) then) =
      _$GroupOverviewStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GroupOverviewStateCopyWithImpl<$Res>
    implements $GroupOverviewStateCopyWith<$Res> {
  _$GroupOverviewStateCopyWithImpl(this._value, this._then);

  final GroupOverviewState _value;
  // ignore: unused_field
  final $Res Function(GroupOverviewState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$GroupOverviewStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc
class _$_Loading with DiagnosticableTreeMixin implements _Loading {
  const _$_Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GroupOverviewState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'GroupOverviewState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result loaded(List<GroupInfo> groups),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result loaded(List<GroupInfo> groups),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GroupOverviewState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  $Res call({List<GroupInfo> groups});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$GroupOverviewStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object groups = freezed,
  }) {
    return _then(_Loaded(
      groups == freezed ? _value.groups : groups as List<GroupInfo>,
    ));
  }
}

/// @nodoc
class _$_Loaded with DiagnosticableTreeMixin implements _Loaded {
  const _$_Loaded(this.groups) : assert(groups != null);

  @override
  final List<GroupInfo> groups;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GroupOverviewState.loaded(groups: $groups)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GroupOverviewState.loaded'))
      ..add(DiagnosticsProperty('groups', groups));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded &&
            (identical(other.groups, groups) ||
                const DeepCollectionEquality().equals(other.groups, groups)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(groups);

  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result loaded(List<GroupInfo> groups),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(groups);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result loaded(List<GroupInfo> groups),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(groups);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements GroupOverviewState {
  const factory _Loaded(List<GroupInfo> groups) = _$_Loaded;

  List<GroupInfo> get groups;
  _$LoadedCopyWith<_Loaded> get copyWith;
}
