//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_info.g.dart';

/// ユーザの登録情報
///
/// Properties:
/// * [name] 
/// * [age] 
/// * [gender] 
/// * [listenGenreId] 
/// * [homeLocation] 
/// * [bio] 
/// * [uid] 
/// * [email] 
/// * [emailVerified] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class UserInfo implements Built<UserInfo, UserInfoBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'age')
  int? get age;

  @BuiltValueField(wireName: r'gender')
  int? get gender;

  @BuiltValueField(wireName: r'listen_genre_id')
  int? get listenGenreId;

  @BuiltValueField(wireName: r'home_location')
  String? get homeLocation;

  @BuiltValueField(wireName: r'bio')
  String? get bio;

  @BuiltValueField(wireName: r'uid')
  String get uid;

  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'email_verified')
  bool get emailVerified;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  UserInfo._();

  factory UserInfo([void updates(UserInfoBuilder b)]) = _$UserInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserInfo> get serializer => _$UserInfoSerializer();
}

class _$UserInfoSerializer implements PrimitiveSerializer<UserInfo> {
  @override
  final Iterable<Type> types = const [UserInfo, _$UserInfo];

  @override
  final String wireName = r'UserInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield object.name == null ? null : serializers.serialize(
      object.name,
      specifiedType: const FullType.nullable(String),
    );
    yield r'age';
    yield object.age == null ? null : serializers.serialize(
      object.age,
      specifiedType: const FullType.nullable(int),
    );
    yield r'gender';
    yield object.gender == null ? null : serializers.serialize(
      object.gender,
      specifiedType: const FullType.nullable(int),
    );
    if (object.listenGenreId != null) {
      yield r'listen_genre_id';
      yield serializers.serialize(
        object.listenGenreId,
        specifiedType: const FullType.nullable(int),
      );
    }
    yield r'home_location';
    yield object.homeLocation == null ? null : serializers.serialize(
      object.homeLocation,
      specifiedType: const FullType.nullable(String),
    );
    yield r'bio';
    yield object.bio == null ? null : serializers.serialize(
      object.bio,
      specifiedType: const FullType.nullable(String),
    );
    yield r'uid';
    yield serializers.serialize(
      object.uid,
      specifiedType: const FullType(String),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'email_verified';
    yield serializers.serialize(
      object.emailVerified,
      specifiedType: const FullType(bool),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UserInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'age':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.age = valueDes;
          break;
        case r'gender':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.gender = valueDes;
          break;
        case r'listen_genre_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.listenGenreId = valueDes;
          break;
        case r'home_location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.homeLocation = valueDes;
          break;
        case r'bio':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.bio = valueDes;
          break;
        case r'uid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.uid = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'email_verified':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.emailVerified = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserInfoBuilder();
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

