// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationModel {

 int get id; String get name; String get type; String get dimension; List<String> get residents; String get url; String get created;
/// Create a copy of LocationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationModelCopyWith<LocationModel> get copyWith => _$LocationModelCopyWithImpl<LocationModel>(this as LocationModel, _$identity);

  /// Serializes this LocationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.dimension, dimension) || other.dimension == dimension)&&const DeepCollectionEquality().equals(other.residents, residents)&&(identical(other.url, url) || other.url == url)&&(identical(other.created, created) || other.created == created));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,dimension,const DeepCollectionEquality().hash(residents),url,created);

@override
String toString() {
  return 'LocationModel(id: $id, name: $name, type: $type, dimension: $dimension, residents: $residents, url: $url, created: $created)';
}


}

/// @nodoc
abstract mixin class $LocationModelCopyWith<$Res>  {
  factory $LocationModelCopyWith(LocationModel value, $Res Function(LocationModel) _then) = _$LocationModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String type, String dimension, List<String> residents, String url, String created
});




}
/// @nodoc
class _$LocationModelCopyWithImpl<$Res>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._self, this._then);

  final LocationModel _self;
  final $Res Function(LocationModel) _then;

/// Create a copy of LocationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? dimension = null,Object? residents = null,Object? url = null,Object? created = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,dimension: null == dimension ? _self.dimension : dimension // ignore: cast_nullable_to_non_nullable
as String,residents: null == residents ? _self.residents : residents // ignore: cast_nullable_to_non_nullable
as List<String>,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationModel].
extension LocationModelPatterns on LocationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationModel value)  $default,){
final _that = this;
switch (_that) {
case _LocationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationModel value)?  $default,){
final _that = this;
switch (_that) {
case _LocationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String type,  String dimension,  List<String> residents,  String url,  String created)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationModel() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.dimension,_that.residents,_that.url,_that.created);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String type,  String dimension,  List<String> residents,  String url,  String created)  $default,) {final _that = this;
switch (_that) {
case _LocationModel():
return $default(_that.id,_that.name,_that.type,_that.dimension,_that.residents,_that.url,_that.created);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String type,  String dimension,  List<String> residents,  String url,  String created)?  $default,) {final _that = this;
switch (_that) {
case _LocationModel() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.dimension,_that.residents,_that.url,_that.created);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationModel extends LocationModel {
  const _LocationModel({required this.id, required this.name, required this.type, required this.dimension, required final  List<String> residents, required this.url, required this.created}): _residents = residents,super._();
  factory _LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String type;
@override final  String dimension;
 final  List<String> _residents;
@override List<String> get residents {
  if (_residents is EqualUnmodifiableListView) return _residents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_residents);
}

@override final  String url;
@override final  String created;

/// Create a copy of LocationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationModelCopyWith<_LocationModel> get copyWith => __$LocationModelCopyWithImpl<_LocationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.dimension, dimension) || other.dimension == dimension)&&const DeepCollectionEquality().equals(other._residents, _residents)&&(identical(other.url, url) || other.url == url)&&(identical(other.created, created) || other.created == created));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,dimension,const DeepCollectionEquality().hash(_residents),url,created);

@override
String toString() {
  return 'LocationModel(id: $id, name: $name, type: $type, dimension: $dimension, residents: $residents, url: $url, created: $created)';
}


}

/// @nodoc
abstract mixin class _$LocationModelCopyWith<$Res> implements $LocationModelCopyWith<$Res> {
  factory _$LocationModelCopyWith(_LocationModel value, $Res Function(_LocationModel) _then) = __$LocationModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String type, String dimension, List<String> residents, String url, String created
});




}
/// @nodoc
class __$LocationModelCopyWithImpl<$Res>
    implements _$LocationModelCopyWith<$Res> {
  __$LocationModelCopyWithImpl(this._self, this._then);

  final _LocationModel _self;
  final $Res Function(_LocationModel) _then;

/// Create a copy of LocationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? dimension = null,Object? residents = null,Object? url = null,Object? created = null,}) {
  return _then(_LocationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,dimension: null == dimension ? _self.dimension : dimension // ignore: cast_nullable_to_non_nullable
as String,residents: null == residents ? _self._residents : residents // ignore: cast_nullable_to_non_nullable
as List<String>,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LocationResponseModel {

 List<LocationModel> get results; LocationPageInfoModel get info;
/// Create a copy of LocationResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationResponseModelCopyWith<LocationResponseModel> get copyWith => _$LocationResponseModelCopyWithImpl<LocationResponseModel>(this as LocationResponseModel, _$identity);

  /// Serializes this LocationResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationResponseModel&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.info, info) || other.info == info));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results),info);

@override
String toString() {
  return 'LocationResponseModel(results: $results, info: $info)';
}


}

/// @nodoc
abstract mixin class $LocationResponseModelCopyWith<$Res>  {
  factory $LocationResponseModelCopyWith(LocationResponseModel value, $Res Function(LocationResponseModel) _then) = _$LocationResponseModelCopyWithImpl;
@useResult
$Res call({
 List<LocationModel> results, LocationPageInfoModel info
});


$LocationPageInfoModelCopyWith<$Res> get info;

}
/// @nodoc
class _$LocationResponseModelCopyWithImpl<$Res>
    implements $LocationResponseModelCopyWith<$Res> {
  _$LocationResponseModelCopyWithImpl(this._self, this._then);

  final LocationResponseModel _self;
  final $Res Function(LocationResponseModel) _then;

/// Create a copy of LocationResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,Object? info = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<LocationModel>,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as LocationPageInfoModel,
  ));
}
/// Create a copy of LocationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationPageInfoModelCopyWith<$Res> get info {
  
  return $LocationPageInfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [LocationResponseModel].
extension LocationResponseModelPatterns on LocationResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _LocationResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _LocationResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LocationModel> results,  LocationPageInfoModel info)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LocationModel> results,  LocationPageInfoModel info)  $default,) {final _that = this;
switch (_that) {
case _LocationResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LocationModel> results,  LocationPageInfoModel info)?  $default,) {final _that = this;
switch (_that) {
case _LocationResponseModel() when $default != null:
return $default(_that.results,_that.info);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationResponseModel extends LocationResponseModel {
  const _LocationResponseModel({required final  List<LocationModel> results, required this.info}): _results = results,super._();
  factory _LocationResponseModel.fromJson(Map<String, dynamic> json) => _$LocationResponseModelFromJson(json);

 final  List<LocationModel> _results;
@override List<LocationModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override final  LocationPageInfoModel info;

/// Create a copy of LocationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationResponseModelCopyWith<_LocationResponseModel> get copyWith => __$LocationResponseModelCopyWithImpl<_LocationResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationResponseModel&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.info, info) || other.info == info));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results),info);

@override
String toString() {
  return 'LocationResponseModel(results: $results, info: $info)';
}


}

/// @nodoc
abstract mixin class _$LocationResponseModelCopyWith<$Res> implements $LocationResponseModelCopyWith<$Res> {
  factory _$LocationResponseModelCopyWith(_LocationResponseModel value, $Res Function(_LocationResponseModel) _then) = __$LocationResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<LocationModel> results, LocationPageInfoModel info
});


@override $LocationPageInfoModelCopyWith<$Res> get info;

}
/// @nodoc
class __$LocationResponseModelCopyWithImpl<$Res>
    implements _$LocationResponseModelCopyWith<$Res> {
  __$LocationResponseModelCopyWithImpl(this._self, this._then);

  final _LocationResponseModel _self;
  final $Res Function(_LocationResponseModel) _then;

/// Create a copy of LocationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,Object? info = null,}) {
  return _then(_LocationResponseModel(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<LocationModel>,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as LocationPageInfoModel,
  ));
}

/// Create a copy of LocationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationPageInfoModelCopyWith<$Res> get info {
  
  return $LocationPageInfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// @nodoc
mixin _$LocationPageInfoModel {

 int get count; int get pages; String? get next; String? get prev;
/// Create a copy of LocationPageInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationPageInfoModelCopyWith<LocationPageInfoModel> get copyWith => _$LocationPageInfoModelCopyWithImpl<LocationPageInfoModel>(this as LocationPageInfoModel, _$identity);

  /// Serializes this LocationPageInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationPageInfoModel&&(identical(other.count, count) || other.count == count)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.next, next) || other.next == next)&&(identical(other.prev, prev) || other.prev == prev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,pages,next,prev);

@override
String toString() {
  return 'LocationPageInfoModel(count: $count, pages: $pages, next: $next, prev: $prev)';
}


}

/// @nodoc
abstract mixin class $LocationPageInfoModelCopyWith<$Res>  {
  factory $LocationPageInfoModelCopyWith(LocationPageInfoModel value, $Res Function(LocationPageInfoModel) _then) = _$LocationPageInfoModelCopyWithImpl;
@useResult
$Res call({
 int count, int pages, String? next, String? prev
});




}
/// @nodoc
class _$LocationPageInfoModelCopyWithImpl<$Res>
    implements $LocationPageInfoModelCopyWith<$Res> {
  _$LocationPageInfoModelCopyWithImpl(this._self, this._then);

  final LocationPageInfoModel _self;
  final $Res Function(LocationPageInfoModel) _then;

/// Create a copy of LocationPageInfoModel
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


/// Adds pattern-matching-related methods to [LocationPageInfoModel].
extension LocationPageInfoModelPatterns on LocationPageInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationPageInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationPageInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationPageInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _LocationPageInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationPageInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _LocationPageInfoModel() when $default != null:
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
case _LocationPageInfoModel() when $default != null:
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
case _LocationPageInfoModel():
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
case _LocationPageInfoModel() when $default != null:
return $default(_that.count,_that.pages,_that.next,_that.prev);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationPageInfoModel extends LocationPageInfoModel {
  const _LocationPageInfoModel({required this.count, required this.pages, required this.next, required this.prev}): super._();
  factory _LocationPageInfoModel.fromJson(Map<String, dynamic> json) => _$LocationPageInfoModelFromJson(json);

@override final  int count;
@override final  int pages;
@override final  String? next;
@override final  String? prev;

/// Create a copy of LocationPageInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationPageInfoModelCopyWith<_LocationPageInfoModel> get copyWith => __$LocationPageInfoModelCopyWithImpl<_LocationPageInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationPageInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationPageInfoModel&&(identical(other.count, count) || other.count == count)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.next, next) || other.next == next)&&(identical(other.prev, prev) || other.prev == prev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,pages,next,prev);

@override
String toString() {
  return 'LocationPageInfoModel(count: $count, pages: $pages, next: $next, prev: $prev)';
}


}

/// @nodoc
abstract mixin class _$LocationPageInfoModelCopyWith<$Res> implements $LocationPageInfoModelCopyWith<$Res> {
  factory _$LocationPageInfoModelCopyWith(_LocationPageInfoModel value, $Res Function(_LocationPageInfoModel) _then) = __$LocationPageInfoModelCopyWithImpl;
@override @useResult
$Res call({
 int count, int pages, String? next, String? prev
});




}
/// @nodoc
class __$LocationPageInfoModelCopyWithImpl<$Res>
    implements _$LocationPageInfoModelCopyWith<$Res> {
  __$LocationPageInfoModelCopyWithImpl(this._self, this._then);

  final _LocationPageInfoModel _self;
  final $Res Function(_LocationPageInfoModel) _then;

/// Create a copy of LocationPageInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? pages = null,Object? next = freezed,Object? prev = freezed,}) {
  return _then(_LocationPageInfoModel(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
