import 'dart:convert';

class Ailment {
  int id;
  String name;
  String description;
  Recovery recovery;
  Protection protection;

  Ailment({
    required this.id,
    required this.name,
    required this.description,
    required this.recovery,
    required this.protection,
  });

  factory Ailment.fromRawJson(String str) => Ailment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ailment.fromJson(Map<String, dynamic> json) => Ailment(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        recovery: Recovery.fromJson(json["recovery"]),
        protection: Protection.fromJson(json["protection"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "recovery": recovery.toJson(),
        "protection": protection.toJson(),
      };
}

class Protection {
  List<Skill> skills;
  List<Item> items;

  Protection({
    required this.skills,
    required this.items,
  });

  factory Protection.fromRawJson(String str) =>
      Protection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Protection.fromJson(Map<String, dynamic> json) => Protection(
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  int id;
  int rarity;
  int value;
  int carryLimit;
  String name;
  String description;

  Item({
    required this.id,
    required this.rarity,
    required this.value,
    required this.carryLimit,
    required this.name,
    required this.description,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        rarity: json["rarity"],
        value: json["value"],
        carryLimit: json["carryLimit"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rarity": rarity,
        "value": value,
        "carryLimit": carryLimit,
        "name": name,
        "description": description,
      };
}

class Skill {
  int id;
  String name;
  String description;

  Skill({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Skill.fromRawJson(String str) => Skill.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}

class Recovery {
  List<Action> actions;
  List<Item> items;

  Recovery({
    required this.actions,
    required this.items,
  });

  factory Recovery.fromRawJson(String str) =>
      Recovery.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Recovery.fromJson(Map<String, dynamic> json) => Recovery(
        actions:
            List<Action>.from(json["actions"].map((x) => actionValues.map[x]!)),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "actions":
            List<dynamic>.from(actions.map((x) => actionValues.reverse[x])),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

enum Action { dODGE }

final actionValues = EnumValues({"dodge": Action.dODGE});

enum Element {
  bLAST,
  dRAGON,
  fIRE,
  iCE,
  pPARALYSIS,
  pOISON,
  sLEEP,
  sTUN,
  tHUNDER,
  wATER
}

final elementValues = EnumValues({
  "blast": Element.bLAST,
  "dragon": Element.dRAGON,
  "fire": Element.fIRE,
  "ice": Element.iCE,
  "paralysis": Element.pPARALYSIS,
  "poison": Element.pOISON,
  "sleep": Element.sLEEP,
  "stun": Element.sTUN,
  "thunder": Element.tHUNDER,
  "water": Element.wATER
});

class Location {
  int id;
  int zoneCount;
  String name;

  Location({
    required this.id,
    required this.zoneCount,
    required this.name,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        zoneCount: json["zoneCount"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "zoneCount": zoneCount,
        "name": name,
      };
}

class Resistance {
  Element element;
  String condition;

  Resistance({
    required this.element,
    required this.condition,
  });

  factory Resistance.fromRawJson(String str) =>
      Resistance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Resistance.fromJson(Map<String, dynamic> json) => Resistance(
        element: elementValues.map[json["element"]]!,
        condition: json["condition"],
      );

  Map<String, dynamic> toJson() => {
        "element": elementValues.reverse[element],
        "condition": condition,
      };
}

class Reward {
  int id;
  Item item;
  List<Condition> conditions;

  Reward({
    required this.id,
    required this.item,
    required this.conditions,
  });

  factory Reward.fromRawJson(String str) => Reward.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reward.fromJson(Map<String, dynamic> json) => Reward(
        id: json["id"],
        item: Item.fromJson(json["item"]),
        conditions: List<Condition>.from(
            json["conditions"].map((x) => Condition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item": item.toJson(),
        "conditions": List<dynamic>.from(conditions.map((x) => x.toJson())),
      };
}

class Condition {
  ConditionType type;
  Rank rank;
  int quantity;
  int chance;
  String subtype;

  Condition({
    required this.type,
    required this.rank,
    required this.quantity,
    required this.chance,
    required this.subtype,
  });

  factory Condition.fromRawJson(String str) =>
      Condition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        type: conditionTypeValues.map[json["type"]]!,
        rank: rankValues.map[json["rank"]]!,
        quantity: json["quantity"],
        chance: json["chance"],
        subtype: json["subtype"],
      );

  Map<String, dynamic> toJson() => {
        "type": conditionTypeValues.reverse[type],
        "rank": rankValues.reverse[rank],
        "quantity": quantity,
        "chance": chance,
        "subtype": subtype,
      };
}

enum Rank { hIGH, lOW }

final rankValues = EnumValues({"high": Rank.hIGH, "low": Rank.lOW});

enum ConditionType {
  cARVE,
  iNVESTIGATION,
  pALICO,
  pLUNDERBLADE,
  rEWARD,
  sHINY,
  tRACK,
  wOUND
}

final conditionTypeValues = EnumValues({
  "carve": ConditionType.cARVE,
  "investigation": ConditionType.iNVESTIGATION,
  "palico": ConditionType.pALICO,
  "plunderblade": ConditionType.pLUNDERBLADE,
  "reward": ConditionType.rEWARD,
  "shiny": ConditionType.sHINY,
  "track": ConditionType.tRACK,
  "wound": ConditionType.wOUND
});

enum NowPlayingResponseType { lARGE, sMALL }

final nowPlayingResponseTypeValues = EnumValues({
  "large": NowPlayingResponseType.lARGE,
  "small": NowPlayingResponseType.sMALL
});

class Weakness {
  Element element;
  int stars;
  String condition;

  Weakness({
    required this.element,
    required this.stars,
    required this.condition,
  });

  factory Weakness.fromRawJson(String str) =>
      Weakness.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Weakness.fromJson(Map<String, dynamic> json) => Weakness(
        element: elementValues.map[json["element"]]!,
        stars: json["stars"],
        condition: json["condition"],
      );

  Map<String, dynamic> toJson() => {
        "element": elementValues.reverse[element],
        "stars": stars,
        "condition": condition,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
