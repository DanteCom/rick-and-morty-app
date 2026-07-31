// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Result<T,F extends Failure> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result<T, F>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Result<$T, $F>()';
}


}

/// @nodoc
class $ResultCopyWith<T,F extends Failure,$Res>  {
$ResultCopyWith(Result<T, F> _, $Res Function(Result<T, F>) __);
}


/// Adds pattern-matching-related methods to [Result].
extension ResultPatterns<T,F extends Failure> on Result<T, F> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Success<T, F> value)?  success,TResult Function( _Error<T, F> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Success<T, F> value)  success,required TResult Function( _Error<T, F> value)  error,}){
final _that = this;
switch (_that) {
case _Success():
return success(_that);case _Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Success<T, F> value)?  success,TResult? Function( _Error<T, F> value)?  error,}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T data)?  success,TResult Function( F failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.data);case _Error() when error != null:
return error(_that.failure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T data)  success,required TResult Function( F failure)  error,}) {final _that = this;
switch (_that) {
case _Success():
return success(_that.data);case _Error():
return error(_that.failure);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T data)?  success,TResult? Function( F failure)?  error,}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.data);case _Error() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Success<T,F extends Failure> implements Result<T, F> {
  const _Success(this.data);
  

 final  T data;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<T, F, _Success<T, F>> get copyWith => __$SuccessCopyWithImpl<T, F, _Success<T, F>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success<T, F>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'Result<$T, $F>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<T,F extends Failure,$Res> implements $ResultCopyWith<T, F, $Res> {
  factory _$SuccessCopyWith(_Success<T, F> value, $Res Function(_Success<T, F>) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class __$SuccessCopyWithImpl<T,F extends Failure,$Res>
    implements _$SuccessCopyWith<T, F, $Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success<T, F> _self;
  final $Res Function(_Success<T, F>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_Success<T, F>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class _Error<T,F extends Failure> implements Result<T, F> {
  const _Error(this.failure);
  

 final  F failure;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<T, F, _Error<T, F>> get copyWith => __$ErrorCopyWithImpl<T, F, _Error<T, F>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error<T, F>&&const DeepCollectionEquality().equals(other.failure, failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failure));

@override
String toString() {
  return 'Result<$T, $F>.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<T,F extends Failure,$Res> implements $ResultCopyWith<T, F, $Res> {
  factory _$ErrorCopyWith(_Error<T, F> value, $Res Function(_Error<T, F>) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 F failure
});




}
/// @nodoc
class __$ErrorCopyWithImpl<T,F extends Failure,$Res>
    implements _$ErrorCopyWith<T, F, $Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error<T, F> _self;
  final $Res Function(_Error<T, F>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Error<T, F>(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as F,
  ));
}


}

// dart format on
