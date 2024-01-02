class Place {
  late Result result;

  Place.fromJson(dynamic jsondata) {
    result = Result.fromJson(jsondata['result']); //jsondata['result']
  }
}

class Result {
  late Geometry geometry;
  Result.fromJson(dynamic jsonData) {
    geometry = Geometry.fromJson(jsonData['geometry']);
  }
}

class Geometry {
  late Location location;
  Geometry.fromJson(dynamic jsondata) {
    location = Location.fromjson(jsondata['location']);
  }
}

class Location {
  late double lat;
  late double lng;
  Location.fromjson(dynamic jsonData) {
    lat = jsonData['lat'];
    lng = jsonData['lng'];
  }
}
