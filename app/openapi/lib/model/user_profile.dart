//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserProfile {
  /// Returns a new [UserProfile] instance.
  UserProfile({
    required this.name,
    required this.age,
    required this.gender,
    this.listenGenreId,
    required this.homeLocation,
    required this.bio,
  });

  String? name;

  int? age;

  /// Minimum value: 0
  int? gender;

  int? listenGenreId;

  String? homeLocation;

  String? bio;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserProfile &&
    other.name == name &&
    other.age == age &&
    other.gender == gender &&
    other.listenGenreId == listenGenreId &&
    other.homeLocation == homeLocation &&
    other.bio == bio;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (age == null ? 0 : age!.hashCode) +
    (gender == null ? 0 : gender!.hashCode) +
    (listenGenreId == null ? 0 : listenGenreId!.hashCode) +
    (homeLocation == null ? 0 : homeLocation!.hashCode) +
    (bio == null ? 0 : bio!.hashCode);

  @override
  String toString() => 'UserProfile[name=$name, age=$age, gender=$gender, listenGenreId=$listenGenreId, homeLocation=$homeLocation, bio=$bio]';

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
    return json;
  }

  /// Returns a new [UserProfile] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserProfile? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserProfile[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserProfile[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserProfile(
        name: mapValueOfType<String>(json, r'name'),
        age: mapValueOfType<int>(json, r'age'),
        gender: mapValueOfType<int>(json, r'gender'),
        listenGenreId: mapValueOfType<int>(json, r'listen_genre_id'),
        homeLocation: mapValueOfType<String>(json, r'home_location'),
        bio: mapValueOfType<String>(json, r'bio'),
      );
    }
    return null;
  }

  static List<UserProfile> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserProfile>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserProfile.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserProfile> mapFromJson(dynamic json) {
    final map = <String, UserProfile>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserProfile.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserProfile-objects as value to a dart map
  static Map<String, List<UserProfile>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserProfile>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserProfile.listFromJson(entry.value, growable: growable,);
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
  };
}

