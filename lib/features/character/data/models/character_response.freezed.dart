// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterResponseModel {

 CharacterPageInfoModel get info; List<CharacterModel> get results;
/// Create a copy of CharacterResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterResponseModelCopyWith<CharacterResponseModel> get copyWith => _$CharacterResponseModelCopyWithImpl<CharacterResponseModel>(this as CharacterResponseModel, _$identity);

  /// Serializes this CharacterResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterResponseModel&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'CharacterResponseModel(info: $info, results: $results)';
}


}

/// @nodoc
abstract mixin class $CharacterResponseModelCopyWith<$Res>  {
  factory $CharacterResponseModelCopyWith(CharacterResponseModel value, $Res Function(CharacterResponseModel) _then) = _$CharacterResponseModelCopyWithImpl;
@useResult
$Res call({
 CharacterPageInfoModel info, List<CharacterModel> results
});


$CharacterPageInfoModelCopyWith<$Res> get info;

}
/// @nodoc
class _$CharacterResponseModelCopyWithImpl<$Res>
    implements $CharacterResponseModelCopyWith<$Res> {
  _$CharacterResponseModelCopyWithImpl(this._self, this._then);

  final CharacterResponseModel _self;
  final $Res Function(CharacterResponseModel) _then;

/// Create a copy of CharacterResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? info = null,Object? results = null,}) {
  return _then(_self.copyWith(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as CharacterPageInfoModel,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<CharacterModel>,
  ));
}
/// Create a copy of CharacterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterPageInfoModelCopyWith<$Res> get info {
  
  return $CharacterPageInfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [CharacterResponseModel].
extension CharacterResponseModelPatterns on CharacterResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterResponseModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CharacterResponseModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterResponseModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CharacterPageInfoModel info,  List<CharacterModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterResponseModel() when $default != null:
return $default(_that.info,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CharacterPageInfoModel info,  List<CharacterModel> results)  $default,) {final _that = this;
switch (_that) {
case _CharacterResponseModel():
return $default(_that.info,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CharacterPageInfoModel info,  List<CharacterModel> results)?  $default,) {final _that = this;
switch (_that) {
case _CharacterResponseModel() when $default != null:
return $default(_that.info,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CharacterResponseModel extends CharacterResponseModel {
  const _CharacterResponseModel({required this.info, required final  List<CharacterModel> results}): _results = results,super._();
  factory _CharacterResponseModel.fromJson(Map<String, dynamic> json) => _$CharacterResponseModelFromJson(json);

@override final  CharacterPageInfoModel info;
 final  List<CharacterModel> _results;
@override List<CharacterModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of CharacterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterResponseModelCopyWith<_CharacterResponseModel> get copyWith => __$CharacterResponseModelCopyWithImpl<_CharacterResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterResponseModel&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'CharacterResponseModel(info: $info, results: $results)';
}


}

/// @nodoc
abstract mixin class _$CharacterResponseModelCopyWith<$Res> implements $CharacterResponseModelCopyWith<$Res> {
  factory _$CharacterResponseModelCopyWith(_CharacterResponseModel value, $Res Function(_CharacterResponseModel) _then) = __$CharacterResponseModelCopyWithImpl;
@override @useResult
$Res call({
 CharacterPageInfoModel info, List<CharacterModel> results
});


@override $CharacterPageInfoModelCopyWith<$Res> get info;

}
/// @nodoc
class __$CharacterResponseModelCopyWithImpl<$Res>
    implements _$CharacterResponseModelCopyWith<$Res> {
  __$CharacterResponseModelCopyWithImpl(this._self, this._then);

  final _CharacterResponseModel _self;
  final $Res Function(_CharacterResponseModel) _then;

/// Create a copy of CharacterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? info = null,Object? results = null,}) {
  return _then(_CharacterResponseModel(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as CharacterPageInfoModel,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<CharacterModel>,
  ));
}

/// Create a copy of CharacterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterPageInfoModelCopyWith<$Res> get info {
  
  return $CharacterPageInfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// @nodoc
mixin _$CharacterPageInfoModel {

 int get count; int get pages; String? get next; String? get prev;
/// Create a copy of CharacterPageInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterPageInfoModelCopyWith<CharacterPageInfoModel> get copyWith => _$CharacterPageInfoModelCopyWithImpl<CharacterPageInfoModel>(this as CharacterPageInfoModel, _$identity);

  /// Serializes this CharacterPageInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterPageInfoModel&&(identical(other.count, count) || other.count == count)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.next, next) || other.next == next)&&(identical(other.prev, prev) || other.prev == prev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,pages,next,prev);

@override
String toString() {
  return 'CharacterPageInfoModel(count: $count, pages: $pages, next: $next, prev: $prev)';
}


}

/// @nodoc
abstract mixin class $CharacterPageInfoModelCopyWith<$Res>  {
  factory $CharacterPageInfoModelCopyWith(CharacterPageInfoModel value, $Res Function(CharacterPageInfoModel) _then) = _$CharacterPageInfoModelCopyWithImpl;
@useResult
$Res call({
 int count, int pages, String? next, String? prev
});




}
/// @nodoc
class _$CharacterPageInfoModelCopyWithImpl<$Res>
    implements $CharacterPageInfoModelCopyWith<$Res> {
  _$CharacterPageInfoModelCopyWithImpl(this._self, this._then);

  final CharacterPageInfoModel _self;
  final $Res Function(CharacterPageInfoModel) _then;

/// Create a copy of CharacterPageInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? pages = null,Object? next = freezed,Object? prev = freezed,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CharacterPageInfoModel].
extension CharacterPageInfoModelPatterns on CharacterPageInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterPageInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterPageInfoModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterPageInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _CharacterPageInfoModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterPageInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterPageInfoModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  int pages,  String? next,  String? prev)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterPageInfoModel() when $default != null:
return $default(_that.count,_that.pages,_that.next,_that.prev);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  int pages,  String? next,  String? prev)  $default,) {final _that = this;
switch (_that) {
case _CharacterPageInfoModel():
return $default(_that.count,_that.pages,_that.next,_that.prev);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  int pages,  String? next,  String? prev)?  $default,) {final _that = this;
switch (_that) {
case _CharacterPageInfoModel() when $default != null:
return $default(_that.count,_that.pages,_that.next,_that.prev);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CharacterPageInfoModel extends CharacterPageInfoModel {
  const _CharacterPageInfoModel({required this.count, required this.pages, required this.next, required this.prev}): super._();
  factory _CharacterPageInfoModel.fromJson(Map<String, dynamic> json) => _$CharacterPageInfoModelFromJson(json);

@override final  int count;
@override final  int pages;
@override final  String? next;
@override final  String? prev;

/// Create a copy of CharacterPageInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterPageInfoModelCopyWith<_CharacterPageInfoModel> get copyWith => __$CharacterPageInfoModelCopyWithImpl<_CharacterPageInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterPageInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterPageInfoModel&&(identical(other.count, count) || other.count == count)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.next, next) || other.next == next)&&(identical(other.prev, prev) || other.prev == prev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,pages,next,prev);

@override
String toString() {
  return 'CharacterPageInfoModel(count: $count, pages: $pages, next: $next, prev: $prev)';
}


}

/// @nodoc
abstract mixin class _$CharacterPageInfoModelCopyWith<$Res> implements $CharacterPageInfoModelCopyWith<$Res> {
  factory _$CharacterPageInfoModelCopyWith(_CharacterPageInfoModel value, $Res Function(_CharacterPageInfoModel) _then) = __$CharacterPageInfoModelCopyWithImpl;
@override @useResult
$Res call({
 int count, int pages, String? next, String? prev
});




}
/// @nodoc
class __$CharacterPageInfoModelCopyWithImpl<$Res>
    implements _$CharacterPageInfoModelCopyWith<$Res> {
  __$CharacterPageInfoModelCopyWithImpl(this._self, this._then);

  final _CharacterPageInfoModel _self;
  final $Res Function(_CharacterPageInfoModel) _then;

/// Create a copy of CharacterPageInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? pages = null,Object? next = freezed,Object? prev = freezed,}) {
  return _then(_CharacterPageInfoModel(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
