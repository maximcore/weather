class Coord {
  const Coord({
    required this.lon,
    required this.lat,
  });

  final num lon;
  final num lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"],
        lat: json["lat"],
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}
