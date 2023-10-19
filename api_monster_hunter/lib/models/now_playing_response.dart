import 'dart:convert';
import 'package:api_monster_hunter/models/models.dart';

class NowPlayingResponse {
  int id;
  NowPlayingResponseType type;
  String species;
  List<Element> elements;
  String name;
  String description;
  List<Ailment> ailments;
  List<Location> locations;
  List<Resistance> resistances;
  List<Weakness> weaknesses;
  List<Reward> rewards;

  NowPlayingResponse({
    required this.id,
    required this.type,
    required this.species,
    required this.elements,
    required this.name,
    required this.description,
    required this.ailments,
    required this.locations,
    required this.resistances,
    required this.weaknesses,
    required this.rewards,
  });

  factory NowPlayingResponse.fromRawJson(String str) =>
      NowPlayingResponse.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) =>
      NowPlayingResponse(
        id: json["id"],
        type: nowPlayingResponseTypeValues.map[json["type"]]!,
        species: json["species"],
        elements: List<Element>.from(
            json["elements"].map((x) => elementValues.map[x]!)),
        name: json["name"],
        description: json["description"],
        ailments: List<Ailment>.from(
            json["ailments"].map((x) => Ailment.fromJson(x))),
        locations: List<Location>.from(
            json["locations"].map((x) => Location.fromJson(x))),
        resistances: List<Resistance>.from(
            json["resistances"].map((x) => Resistance.fromJson(x))),
        weaknesses: List<Weakness>.from(
            json["weaknesses"].map((x) => Weakness.fromJson(x))),
        rewards:
            List<Reward>.from(json["rewards"].map((x) => Reward.fromJson(x))),
      );

/*   Map<String, dynamic> toJson() => {
        "id": id,
        "type": nowPlayingResponseTypeValues.reverse[type],
        "species": species,
        "elements":
            List<dynamic>.from(elements.map((x) => elementValues.reverse[x])),
        "name": name,
        "description": description,
        "ailments": List<dynamic>.from(ailments.map((x) => x.toJson())),
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
        "resistances": List<dynamic>.from(resistances.map((x) => x.toJson())),
        "weaknesses": List<dynamic>.from(weaknesses.map((x) => x.toJson())),
        "rewards": List<dynamic>.from(rewards.map((x) => x.toJson())),
      }; */
}
