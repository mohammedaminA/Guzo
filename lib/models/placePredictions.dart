class PlacePredictions {
  String secondary_text;
  String main_text;
  String place_id;

  PlacePredictions({this.secondary_text, this.main_text, this.place_id});

  PlacePredictions.fromJson(Map<String, dynamic> json) {
    place_id = json[0].place_id;
    main_text = json[0].structured_formatting.main_text;
    secondary_text = json[1].structured_formatting.secondary_text;
  }
}
