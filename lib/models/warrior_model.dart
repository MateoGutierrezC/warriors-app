/* import 'dart:convert'; */

class Warrior {
  String id;
  String champion;
  String date;
  String splashArt;
  String origen;
  String resource;
  List<Position> position;
  List<Hability> habilities;
  DateTime createdAt;
  DateTime updatedAt;

  Warrior({
    required this.id,
    required this.champion,
    required this.date,
    required this.splashArt,
    required this.origen,
    required this.resource,
    required this.position,
    required this.habilities,
    required this.createdAt,
    required this.updatedAt,
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
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
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

class Hability {
  List<Ability> pasive;
  List<Ability> q;
  List<Ability> w;
  List<Ability> e;
  List<Ability> r;
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
        pasive:
            List<Ability>.from(json["pasive"].map((x) => Ability.fromJson(x))),
        q: List<Ability>.from(json["q"].map((x) => Ability.fromJson(x))),
        w: List<Ability>.from(json["w"].map((x) => Ability.fromJson(x))),
        e: List<Ability>.from(json["e"].map((x) => Ability.fromJson(x))),
        r: List<Ability>.from(json["r"].map((x) => Ability.fromJson(x))),
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

class Ability {
  String abilityIcon;
  String title;
  String description;
  String id;

  Ability({
    required this.abilityIcon,
    required this.title,
    required this.description,
    required this.id,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
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
