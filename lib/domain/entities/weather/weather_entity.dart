import 'dart:convert';

import 'package:weather/domain/entities/weather/weather_properties/clouds.dart';
import 'package:weather/domain/entities/weather/weather_properties/coord.dart';
import 'package:weather/domain/entities/weather/weather_properties/main.dart';
import 'package:weather/domain/entities/weather/weather_properties/sys.dart';
import 'package:weather/domain/entities/weather/weather_properties/weather.dart';
import 'package:weather/domain/entities/weather/weather_properties/wind.dart';


WeatherEntity weatherEntityFromJson(String str) => WeatherEntity.fromJson(json.decode(str));

String weatherEntityToJson(WeatherEntity data) => json.encode(data.toJson());

class WeatherEntity {
  WeatherEntity({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final num visibility;
  final Wind wind;
  final Clouds clouds;
  final num dt;
  final Sys sys;
  final num timezone;
  final num id;
  final String name;
  final num cod;

  factory WeatherEntity.fromJson(Map<String, dynamic> json) => WeatherEntity(
        coord: Coord.fromJson(json["coord"]),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        base: json["base"],
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromJson(json["wind"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}
