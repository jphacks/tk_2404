//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserInfo {
  /// Returns a new [UserInfo] instance.
  UserInfo({
    required this.name,
    required this.age,
    required this.gender,
    this.listenGenreId,
    required this.homeLocation,
    required this.bio,
    required this.uid,
    required this.email,
    required this.emailVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  String? name;

  int? age;

  /// Minimum value: 0
  int? gender;

  int? listenGenreId;

  String? homeLocation;

  String? bio;

  String uid;

  String email;

  bool emailVerified;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserInfo &&
    other.name == name &&
    other.age == age &&
    other.gender == gender &&
    other.listenGenreId == listenGenreId &&
    other.homeLocation == homeLocation &&
    other.bio == bio &&
    other.uid == uid &&
    other.email == email &&
    other.emailVerified == emailVerified &&
    other.createdAt == createdAt &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (age == null ? 0 : age!.hashCode) +
    (gender == null ? 0 : gender!.hashCode) +
    (listenGenreId == null ? 0 : listenGenreId!.hashCode) +
    (homeLocation == null ? 0 : homeLocation!.hashCode) +
    (bio == null ? 0 : bio!.hashCode) +
    (uid.hashCode) +
    (email.hashCode) +
    (emailVerified.hashCode) +
    (createdAt.hashCode) +
    (updatedAt.hashCode);

  @override
  String toString() => 'UserInfo[name=$name, age=$age, gender=$gender, listenGenreId=$listenGenreId, homeLocation=$homeLocation, bio=$bio, uid=$uid, email=$email, emailVerified=$emailVerified, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.age != null) {
      json[r'age'] = this.age;
    } else {
      json[r'age'] = null;
    }
    if (this.gender != null) {
      json[r'gender'] = this.gender;
    } else {
      json[r'gender'] = null;
    }
    if (this.listenGenreId != null) {
      json[r'listen_genre_id'] = this.listenGenreId;
    } else {
      json[r'listen_genre_id'] = null;
    }
    if (this.homeLocation != null) {
      json[r'home_location'] = this.homeLocation;
    } else {
      json[r'home_location'] = null;
    }
    if (this.bio != null) {
      json[r'bio'] = this.bio;
    } else {
      json[r'bio'] = null;
    }
      json[r'uid'] = this.uid;
      json[r'email'] = this.email;
      json[r'email_verified'] = this.emailVerified;
      json[r'created_at'] = this.createdAt.toUtc().toIso8601String();
      json[r'updated_at'] = this.updatedAt.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [UserInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserInfo(
        name: mapValueOfType<String>(json, r'name'),
        age: mapValueOfType<int>(json, r'age'),
        gender: mapValueOfType<int>(json, r'gender'),
        listenGenreId: mapValueOfType<int>(json, r'listen_genre_id'),
        homeLocation: mapValueOfType<String>(json, r'home_location'),
        bio: mapValueOfType<String>(json, r'bio'),
        uid: mapValueOfType<String>(json, r'uid')!,
        email: mapValueOfType<String>(json, r'email')!,
        emailVerified: mapValueOfType<bool>(json, r'email_verified')!,
        createdAt: mapDateTime(json, r'created_at', r'')!,
        updatedAt: mapDateTime(json, r'updated_at', r'')!,
      );
    }
    return null;
  }

  static List<UserInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserInfo> mapFromJson(dynamic json) {
    final map = <String, UserInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserInfo-objects as value to a dart map
  static Map<String, List<UserInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'age',
    'gender',
    'home_location',
    'bio',
    'uid',
    'email',
    'email_verified',
    'created_at',
    'updated_at',
  };
}

