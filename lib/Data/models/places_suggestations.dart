class PlacesSuggestations {
  final String description;
  final String placeId;

  factory PlacesSuggestations.fromJson(Map<String, dynamic> jsonData) {
    return PlacesSuggestations(
      description: jsonData['description'],
      placeId: jsonData['place_id'],
    );
  }

  PlacesSuggestations({required this.description, required this.placeId});
}
