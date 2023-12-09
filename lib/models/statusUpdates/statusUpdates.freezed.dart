// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statusUpdates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StatusUpdates {
  List<Map<String, dynamic>> get Updates => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatusUpdatesCopyWith<StatusUpdates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusUpdatesCopyWith<$Res> {
  factory $StatusUpdatesCopyWith(
          StatusUpdates value, $Res Function(StatusUpdates) then) =
      _$StatusUpdatesCopyWithImpl<$Res, StatusUpdates>;
  @useResult
  $Res call({List<Map<String, dynamic>> Updates});
}

/// @nodoc
class _$StatusUpdatesCopyWithImpl<$Res, $Val extends StatusUpdates>
    implements $StatusUpdatesCopyWith<$Res> {
  _$StatusUpdatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Updates = null,
  }) {
    return _then(_value.copyWith(
      Updates: null == Updates
          ? _value.Updates
          : Updates // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusUpdatesImplCopyWith<$Res>
    implements $StatusUpdatesCopyWith<$Res> {
  factory _$$StatusUpdatesImplCopyWith(
          _$StatusUpdatesImpl value, $Res Function(_$StatusUpdatesImpl) then) =
      __$$StatusUpdatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, dynamic>> Updates});
}

/// @nodoc
class __$$StatusUpdatesImplCopyWithImpl<$Res>
    extends _$StatusUpdatesCopyWithImpl<$Res, _$StatusUpdatesImpl>
    implements _$$StatusUpdatesImplCopyWith<$Res> {
  __$$StatusUpdatesImplCopyWithImpl(
      _$StatusUpdatesImpl _value, $Res Function(_$StatusUpdatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Updates = null,
  }) {
    return _then(_$StatusUpdatesImpl(
      Updates: null == Updates
          ? _value._Updates
          : Updates // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$StatusUpdatesImpl implements _StatusUpdates {
  _$StatusUpdatesImpl({required final List<Map<String, dynamic>> Updates})
      : _Updates = Updates;

  final List<Map<String, dynamic>> _Updates;
  @override
  List<Map<String, dynamic>> get Updates {
    if (_Updates is EqualUnmodifiableListView) return _Updates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_Updates);
  }

  @override
  String toString() {
    return 'StatusUpdates(Updates: $Updates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusUpdatesImpl &&
            const DeepCollectionEquality().equals(other._Updates, _Updates));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_Updates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusUpdatesImplCopyWith<_$StatusUpdatesImpl> get copyWith =>
      __$$StatusUpdatesImplCopyWithImpl<_$StatusUpdatesImpl>(this, _$identity);
}

abstract class _StatusUpdates implements StatusUpdates {
  factory _StatusUpdates({required final List<Map<String, dynamic>> Updates}) =
      _$StatusUpdatesImpl;

  @override
  List<Map<String, dynamic>> get Updates;
  @override
  @JsonKey(ignore: true)
  _$$StatusUpdatesImplCopyWith<_$StatusUpdatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
