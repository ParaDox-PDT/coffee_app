
class DefaultModelFields{
  static const String id="id";
  static const String name="name";
  static const String age="age";

  static const String defaultTable = "default_table";
}


class DefaultModel {
  int? id;

  final num age;

  final String name;

  DefaultModel({this.id,required this.age, required this.name});

  factory DefaultModel.fromJson(Map<String, dynamic> json) {
    return DefaultModel(
        id: json[DefaultModelFields.id] ?? 0,
        age: json["age"] as num? ?? 0,
        name: json["name"] as String? ?? "");
  }

  DefaultModel copyWith({
    String? name,
    num? age,
    int? id,
  }) {
    return DefaultModel(
      name: name ?? this.name,
      age: age ?? this.age,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DefaultModelFields.name: name,
      DefaultModelFields.id: age,
    };
  }

  @override
  String toString() {
    return '''
      name: $name
      age: $age
      id: $id, 
    ''';
  }
}
