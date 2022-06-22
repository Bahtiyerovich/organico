class OrganicoModel {
  OrganicoModel({this.category, this.name});

  String? category;
  Name? name;

  factory OrganicoModel.fromJson(Map<String, dynamic> json) => OrganicoModel(
        category: json["category"],
        name: Name.fromJson(json["name"]),
      );
}

class Name {
  Name({this.type, this.img});

  String? type;
  String? img;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        type: json["type"],
        img: json["img"],
      );
}
