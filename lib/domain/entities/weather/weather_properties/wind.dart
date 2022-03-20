class Wind {
  const Wind({
    required this.speed,
    required this.deg,
  });

  final num speed;
  final num deg;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"],
    deg: json["deg"],
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
  };
}
