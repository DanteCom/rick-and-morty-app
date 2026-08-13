// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpisodeResponseModel {

 List<EpisodeModel> get results; EpisodePageInfoModel get info;
/// Create a copy of EpisodeResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeResponseModelCopyWith<EpisodeResponseModel> get copyWith => _$EpisodeResponseModelCopyWithImpl<EpisodeResponseModel>(this as EpisodeResponseModel, _$identity);

  /// Serializes this EpisodeResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpisodeResponseModel&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.info, info) || other.info == info));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results),info);

@override
String toString() {
  return 'EpisodeResponseModel(results: $results, info: $info)';
}


}

/// @nodoc
abstract mixin class $EpisodeResponseModelCopyWith<$Res>  {
  factory $EpisodeResponseModelCopyWith(EpisodeResponseModel value, $Res Function(EpisodeResponseModel) _then) = _$EpisodeResponseModelCopyWithImpl;
@useResult
$Res call({
 List<EpisodeModel> results, EpisodePageInfoModel info
});


$EpisodePageInfoModelCopyWith<$Res> get info;

}
/// @nodoc
class _$EpisodeResponseModelCopyWithImpl<$Res>
    implements $EpisodeResponseModelCopyWith<$Res> {
  _$EpisodeResponseModelCopyWithImpl(this._self, this._then);

  final EpisodeResponseModel _self;
  final $Res Function(EpisodeResponseModel) _then;

/// Create a copy of EpisodeResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,Object? info = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<EpisodeModel>,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as EpisodePageInfoModel,
  ));
}
/// Create a copy of EpisodeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EpisodePageInfoModelCopyWith<$Res> get info {
  
  return $EpisodePageInfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [EpisodeResponseModel].
extension EpisodeResponseModelPatterns on EpisodeResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpisodeResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpisodeResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpisodeResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _EpisodeResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpisodeResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _EpisodeResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EpisodeModel> results,  EpisodePageInfoModel info)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpisodeResponseModel() when $default != null:
return $default(_that.results,_that.info);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EpisodeModel> results,  EpisodePageInfoModel info)  $default,) {final _that = this;
switch (_that) {
case _EpisodeResponseModel():
return $default(_that.results,_that.info);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EpisodeModel> results,  EpisodePageInfoModel info)?  $default,) {final _that = this;
switch (_that) {
case _EpisodeResponseModel() when $default != null:
return $default(_that.results,_that.info);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EpisodeResponseModel extends EpisodeResponseModel {
  const _EpisodeResponseModel({required final  List<EpisodeModel> results, required this.info}): _results = results,super._();
  factory _EpisodeResponseModel.fromJson(Map<String, dynamic> json) => _$EpisodeResponseModelFromJson(json);

 final  List<EpisodeModel> _results;
@override List<EpisodeModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override final  EpisodePageInfoModel info;

/// Create a copy of EpisodeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeResponseModelCopyWith<_EpisodeResponseModel> get copyWith => __$EpisodeResponseModelCopyWithImpl<_EpisodeResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpisodeResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpisodeResponseModel&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.info, info) || other.info == info));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results),info);

@override
String toString() {
  return 'EpisodeResponseModel(results: $results, info: $info)';
}


}

/// @nodoc
abstract mixin class _$EpisodeResponseModelCopyWith<$Res> implements $EpisodeResponseModelCopyWith<$Res> {
  factory _$EpisodeResponseModelCopyWith(_EpisodeResponseModel value, $Res Function(_EpisodeResponseModel) _then) = __$EpisodeResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<EpisodeModel> results, EpisodePageInfoModel info
});


@override $EpisodePageInfoModelCopyWith<$Res> get info;

}
/// @nodoc
class __$EpisodeResponseModelCopyWithImpl<$Res>
    implements _$EpisodeResponseModelCopyWith<$Res> {
  __$EpisodeResponseModelCopyWithImpl(this._self, this._then);

  final _EpisodeResponseModel _self;
  final $Res Function(_EpisodeResponseModel) _then;

/// Create a copy of EpisodeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,Object? info = null,}) {
  return _then(_EpisodeResponseModel(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<EpisodeModel>,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as EpisodePageInfoModel,
  ));
}

/// Create a copy of EpisodeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EpisodePageInfoModelCopyWith<$Res> get info {
  
  return $EpisodePageInfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// @nodoc
mixin _$EpisodePageInfoModel {

 int get count; int get pages; String? get next; String? get prev;
/// Create a copy of EpisodePageInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodePageInfoModelCopyWith<EpisodePageInfoModel> get copyWith => _$EpisodePageInfoModelCopyWithImpl<EpisodePageInfoModel>(this as EpisodePageInfoModel, _$identity);

  /// Serializes this EpisodePageInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpisodePageInfoModel&&(identical(other.count, count) || other.count == count)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.next, next) || other.next == next)&&(identical(other.prev, prev) || other.prev == prev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,pages,next,prev);

@override
String toString() {
  return 'EpisodePageInfoModel(count: $count, pages: $pages, next: $next, prev: $prev)';
}


}

/// @nodoc
abstract mixin class $EpisodePageInfoModelCopyWith<$Res>  {
  factory $EpisodePageInfoModelCopyWith(EpisodePageInfoModel value, $Res Function(EpisodePageInfoModel) _then) = _$EpisodePageInfoModelCopyWithImpl;
@useResult
$Res call({
 int count, int pages, String? next, String? prev
});




}
/// @nodoc
class _$EpisodePageInfoModelCopyWithImpl<$Res>
    implements $EpisodePageInfoModelCopyWith<$Res> {
  _$EpisodePageInfoModelCopyWithImpl(this._self, this._then);

  final EpisodePageInfoModel _self;
  final $Res Function(EpisodePageInfoModel) _then;

/// Create a copy of EpisodePageInfoModel
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


/// Adds pattern-matching-related methods to [EpisodePageInfoModel].
extension EpisodePageInfoModelPatterns on EpisodePageInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpisodePageInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpisodePageInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpisodePageInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _EpisodePageInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpisodePageInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _EpisodePageInfoModel() when $default != null:
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
case _EpisodePageInfoModel() when $default != null:
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
case _EpisodePageInfoModel():
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
case _EpisodePageInfoModel() when $default != null:
return $default(_that.count,_that.pages,_that.next,_that.prev);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EpisodePageInfoModel extends EpisodePageInfoModel {
  const _EpisodePageInfoModel({required this.count, required this.pages, required this.next, required this.prev}): super._();
  factory _EpisodePageInfoModel.fromJson(Map<String, dynamic> json) => _$EpisodePageInfoModelFromJson(json);

@override final  int count;
@override final  int pages;
@override final  String? next;
@override final  String? prev;

/// Create a copy of EpisodePageInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodePageInfoModelCopyWith<_EpisodePageInfoModel> get copyWith => __$EpisodePageInfoModelCopyWithImpl<_EpisodePageInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpisodePageInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpisodePageInfoModel&&(identical(other.count, count) || other.count == count)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.next, next) || other.next == next)&&(identical(other.prev, prev) || other.prev == prev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,pages,next,prev);

@override
String toString() {
  return 'EpisodePageInfoModel(count: $count, pages: $pages, next: $next, prev: $prev)';
}


}

/// @nodoc
abstract mixin class _$EpisodePageInfoModelCopyWith<$Res> implements $EpisodePageInfoModelCopyWith<$Res> {
  factory _$EpisodePageInfoModelCopyWith(_EpisodePageInfoModel value, $Res Function(_EpisodePageInfoModel) _then) = __$EpisodePageInfoModelCopyWithImpl;
@override @useResult
$Res call({
 int count, int pages, String? next, String? prev
});




}
/// @nodoc
class __$EpisodePageInfoModelCopyWithImpl<$Res>
    implements _$EpisodePageInfoModelCopyWith<$Res> {
  __$EpisodePageInfoModelCopyWithImpl(this._self, this._then);

  final _EpisodePageInfoModel _self;
  final $Res Function(_EpisodePageInfoModel) _then;

/// Create a copy of EpisodePageInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? pages = null,Object? next = freezed,Object? prev = freezed,}) {
  return _then(_EpisodePageInfoModel(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
