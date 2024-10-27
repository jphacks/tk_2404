//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'gps_request_body.g.dart';

/// GPSRequestBody
///
/// Properties:
/// * [latitude] 
/// * [longitude] 
/// * [musicUrl] 
@BuiltValue()
abstract class GPSRequestBody implements Built<GPSRequestBody, GPSRequestBodyBuilder> {
  @BuiltValueField(wireName: r'latitude')
  num? get latitude;

  @BuiltValueField(wireName: r'longitude')
  num? get longitude;

  @BuiltValueField(wireName: r'music_url')
  String get musicUrl;

  GPSRequestBody._();

  factory GPSRequestBody([void updates(GPSRequestBodyBuilder b)]) = _$GPSRequestBody;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GPSRequestBodyBuilder b) => b
      ..latitude = 0.0
      ..longitude = 0.0;

  @BuiltValueSerializer(custom: true)
  static Serializer<GPSRequestBody> get serializer => _$GPSRequestBodySerializer();
}

class _$GPSRequestBodySerializer implements PrimitiveSerializer<GPSRequestBody> {
  @override
  final Iterable<Type> types = const [GPSRequestBody, _$GPSRequestBody];

  @override
  final String wireName = r'GPSRequestBody';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GPSRequestBody object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.latitude != null) {
      yield r'latitude';
      yield serializers.serialize(
        object.latitude,
        specifiedType: const FullType(num),
      );
    }
    if (object.longitude != null) {
      yield r'longitude';
      yield serializers.serialize(
        object.longitude,
        specifiedType: const FullType(num),
      );
    }
    yield r'music_url';
    yield serializers.serialize(
      object.musicUrl,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GPSRequestBody object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GPSRequestBodyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'latitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.latitude = valueDes;
          break;
        case r'longitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.longitude = valueDes;
          break;
        case r'music_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.musicUrl = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GPSRequestBody deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GPSRequestBodyBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

