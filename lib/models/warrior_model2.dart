// To parse this JSON data, do
//
//     final Warrior = WarriorFromJson(jsonString);

import 'dart:convert';

Warrior warriorFromJson(String str) => Warrior.fromJson(json.decode(str));

String warriorToJson(Warrior data) => json.encode(data.toJson());

class Warrior {
  String id;
  String champion;
  String date;
  String splashArt;
  String origen;
  String resource;
  List<Position> position;
  List<Hability> habilities;

  Warrior({
    required this.id,
    required this.champion,
    required this.date,
    required this.splashArt,
    required this.origen,
    required this.resource,
    required this.position,
    required this.habilities,
  });

  factory Warrior.fromJson(Map<String, dynamic> json) => Warrior(
        id: json["id"],
        champion: json["champion"],
        date: json["date"],
        splashArt: json["splash_art"],
        origen: json["origen"],
        resource: json["resource"],
        position: List<Position>.from(
            json["position"].map((x) => Position.fromJson(x))),
        habilities: List<Hability>.from(
            json["habilities"].map((x) => Hability.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "champion": champion,
        "date": date,
        "splash_art": splashArt,
        "origen": origen,
        "resource": resource,
        "position": List<dynamic>.from(position.map((x) => x.toJson())),
        "habilities": List<dynamic>.from(habilities.map((x) => x.toJson())),
      };
}

class Hability {
  List<E> pasive;
  List<E> q;
  List<E> w;
  List<E> e;
  List<E> r;
  String id;

  Hability({
    required this.pasive,
    required this.q,
    required this.w,
    required this.e,
    required this.r,
    required this.id,
  });

  factory Hability.fromJson(Map<String, dynamic> json) => Hability(
        pasive: List<E>.from(json["pasive"].map((x) => E.fromJson(x))),
        q: List<E>.from(json["q"].map((x) => E.fromJson(x))),
        w: List<E>.from(json["w"].map((x) => E.fromJson(x))),
        e: List<E>.from(json["e"].map((x) => E.fromJson(x))),
        r: List<E>.from(json["r"].map((x) => E.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "pasive": List<dynamic>.from(pasive.map((x) => x.toJson())),
        "q": List<dynamic>.from(q.map((x) => x.toJson())),
        "w": List<dynamic>.from(w.map((x) => x.toJson())),
        "e": List<dynamic>.from(e.map((x) => x.toJson())),
        "r": List<dynamic>.from(r.map((x) => x.toJson())),
        "id": id,
      };
}

class E {
  String abilityIcon;
  String title;
  String description;
  String id;

  E({
    required this.abilityIcon,
    required this.title,
    required this.description,
    required this.id,
  });

  factory E.fromJson(Map<String, dynamic> json) => E(
        abilityIcon: json["abilityIcon"],
        title: json["title"],
        description: json["description"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "abilityIcon": abilityIcon,
        "title": title,
        "description": description,
        "id": id,
      };
}

class Position {
  String rol;
  String type;
  String id;

  Position({
    required this.rol,
    required this.type,
    required this.id,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        rol: json["rol"],
        type: json["type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "rol": rol,
        "type": type,
        "id": id,
      };
}
