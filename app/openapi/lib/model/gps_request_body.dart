//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GPSRequestBody {
  /// Returns a new [GPSRequestBody] instance.
  GPSRequestBody({
    this.latitude = 0.0,
    this.longitude = 0.0,
    required this.musicUrl,
  });

  num latitude;

  num longitude;

  String musicUrl;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GPSRequestBody &&
    other.latitude == latitude &&
    other.longitude == longitude &&
    other.musicUrl == musicUrl;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (latitude.hashCode) +
    (longitude.hashCode) +
    (musicUrl.hashCode);

  @override
  String toString() => 'GPSRequestBody[latitude=$latitude, longitude=$longitude, musicUrl=$musicUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'latitude'] = this.latitude;
      json[r'longitude'] = this.longitude;
      json[r'music_url'] = this.musicUrl;
    return json;
  }

  /// Returns a new [GPSRequestBody] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GPSRequestBody? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GPSRequestBody[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GPSRequestBody[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GPSRequestBody(
        latitude: num.parse('${json[r'latitude']}'),
        longitude: num.parse('${json[r'longitude']}'),
        musicUrl: mapValueOfType<String>(json, r'music_url')!,
      );
    }
    return null;
  }

  static List<GPSRequestBody> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GPSRequestBody>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GPSRequestBody.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GPSRequestBody> mapFromJson(dynamic json) {
    final map = <String, GPSRequestBody>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GPSRequestBody.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GPSRequestBody-objects as value to a dart map
  static Map<String, List<GPSRequestBody>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GPSRequestBody>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GPSRequestBody.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'music_url',
  };
}

