// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppFailure()';
}


}

/// @nodoc
class $AppFailureCopyWith<$Res>  {
$AppFailureCopyWith(AppFailure _, $Res Function(AppFailure) __);
}


/// Adds pattern-matching-related methods to [AppFailure].
extension AppFailurePatterns on AppFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NoConnection value)?  noConnection,TResult Function( _RequestLimit value)?  requestLimit,TResult Function( _NotFound value)?  notFound,TResult Function( _Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoConnection() when noConnection != null:
return noConnection(_that);case _RequestLimit() when requestLimit != null:
return requestLimit(_that);case _NotFound() when notFound != null:
return notFound(_that);case _Unknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NoConnection value)  noConnection,required TResult Function( _RequestLimit value)  requestLimit,required TResult Function( _NotFound value)  notFound,required TResult Function( _Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case _NoConnection():
return noConnection(_that);case _RequestLimit():
return requestLimit(_that);case _NotFound():
return notFound(_that);case _Unknown():
return unknown(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NoConnection value)?  noConnection,TResult? Function( _RequestLimit value)?  requestLimit,TResult? Function( _NotFound value)?  notFound,TResult? Function( _Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _NoConnection() when noConnection != null:
return noConnection(_that);case _RequestLimit() when requestLimit != null:
return requestLimit(_that);case _NotFound() when notFound != null:
return notFound(_that);case _Unknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  noConnection,TResult Function()?  requestLimit,TResult Function()?  notFound,TResult Function()?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoConnection() when noConnection != null:
return noConnection();case _RequestLimit() when requestLimit != null:
return requestLimit();case _NotFound() when notFound != null:
return notFound();case _Unknown() when unknown != null:
return unknown();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  noConnection,required TResult Function()  requestLimit,required TResult Function()  notFound,required TResult Function()  unknown,}) {final _that = this;
switch (_that) {
case _NoConnection():
return noConnection();case _RequestLimit():
return requestLimit();case _NotFound():
return notFound();case _Unknown():
return unknown();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  noConnection,TResult? Function()?  requestLimit,TResult? Function()?  notFound,TResult? Function()?  unknown,}) {final _that = this;
switch (_that) {
case _NoConnection() when noConnection != null:
return noConnection();case _RequestLimit() when requestLimit != null:
return requestLimit();case _NotFound() when notFound != null:
return notFound();case _Unknown() when unknown != null:
return unknown();case _:
  return null;

}
}

}

/// @nodoc


class _NoConnection extends AppFailure {
  const _NoConnection(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoConnection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppFailure.noConnection()';
}


}




/// @nodoc


class _RequestLimit extends AppFailure {
  const _RequestLimit(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestLimit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppFailure.requestLimit()';
}


}




/// @nodoc


class _NotFound extends AppFailure {
  const _NotFound(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppFailure.notFound()';
}


}




/// @nodoc


class _Unknown extends AppFailure {
  const _Unknown(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppFailure.unknown()';
}


}




// dart format on
