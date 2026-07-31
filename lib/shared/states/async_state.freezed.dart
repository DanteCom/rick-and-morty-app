// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AsyncState<F extends Failure> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncState<F>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncState<$F>()';
}


}

/// @nodoc
class $AsyncStateCopyWith<F extends Failure,$Res>  {
$AsyncStateCopyWith(AsyncState<F> _, $Res Function(AsyncState<F>) __);
}


/// Adds pattern-matching-related methods to [AsyncState].
extension AsyncStatePatterns<F extends Failure> on AsyncState<F> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle<F> value)?  idle,TResult Function( _Loading<F> value)?  loading,TResult Function( _Error<F> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle<F> value)  idle,required TResult Function( _Loading<F> value)  loading,required TResult Function( _Error<F> value)  error,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _Loading():
return loading(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle<F> value)?  idle,TResult? Function( _Loading<F> value)?  loading,TResult? Function( _Error<F> value)?  error,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function( F failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Loading() when loading != null:
return loading();case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function( F failure)  error,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Loading():
return loading();case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function( F failure)?  error,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Idle<F extends Failure> implements AsyncState<F> {
  const _Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle<F>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncState<$F>.idle()';
}


}




/// @nodoc


class _Loading<F extends Failure> implements AsyncState<F> {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading<F>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncState<$F>.loading()';
}


}




/// @nodoc


class _Error<F extends Failure> implements AsyncState<F> {
  const _Error(this.failure);
  

 final  F failure;

/// Create a copy of AsyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<F, _Error<F>> get copyWith => __$ErrorCopyWithImpl<F, _Error<F>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error<F>&&const DeepCollectionEquality().equals(other.failure, failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failure));

@override
String toString() {
  return 'AsyncState<$F>.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<F extends Failure,$Res> implements $AsyncStateCopyWith<F, $Res> {
  factory _$ErrorCopyWith(_Error<F> value, $Res Function(_Error<F>) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 F failure
});




}
/// @nodoc
class __$ErrorCopyWithImpl<F extends Failure,$Res>
    implements _$ErrorCopyWith<F, $Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error<F> _self;
  final $Res Function(_Error<F>) _then;

/// Create a copy of AsyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Error<F>(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as F,
  ));
}


}

// dart format on
