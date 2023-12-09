// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membersListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Members {
  List<Map<String, dynamic>> get members => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MembersCopyWith<Members> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembersCopyWith<$Res> {
  factory $MembersCopyWith(Members value, $Res Function(Members) then) =
      _$MembersCopyWithImpl<$Res, Members>;
  @useResult
  $Res call({List<Map<String, dynamic>> members});
}

/// @nodoc
class _$MembersCopyWithImpl<$Res, $Val extends Members>
    implements $MembersCopyWith<$Res> {
  _$MembersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MembersImplCopyWith<$Res> implements $MembersCopyWith<$Res> {
  factory _$$MembersImplCopyWith(
          _$MembersImpl value, $Res Function(_$MembersImpl) then) =
      __$$MembersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, dynamic>> members});
}

/// @nodoc
class __$$MembersImplCopyWithImpl<$Res>
    extends _$MembersCopyWithImpl<$Res, _$MembersImpl>
    implements _$$MembersImplCopyWith<$Res> {
  __$$MembersImplCopyWithImpl(
      _$MembersImpl _value, $Res Function(_$MembersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
  }) {
    return _then(_$MembersImpl(
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$MembersImpl implements _Members {
  _$MembersImpl({required final List<Map<String, dynamic>> members})
      : _members = members;

  final List<Map<String, dynamic>> _members;
  @override
  List<Map<String, dynamic>> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'Members(members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MembersImpl &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MembersImplCopyWith<_$MembersImpl> get copyWith =>
      __$$MembersImplCopyWithImpl<_$MembersImpl>(this, _$identity);
}

abstract class _Members implements Members {
  factory _Members({required final List<Map<String, dynamic>> members}) =
      _$MembersImpl;

  @override
  List<Map<String, dynamic>> get members;
  @override
  @JsonKey(ignore: true)
  _$$MembersImplCopyWith<_$MembersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
