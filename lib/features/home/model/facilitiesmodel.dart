import 'dart:convert';

class FacilitiesModel {
  int? id;
  String? icon;
  String? name;
  int? color;
  FacilitiesModel({
    this.id,
    this.icon,
    this.name,
    this.color,
  });

  FacilitiesModel copyWith({
    int? id,
    String? icon,
    String? name,
    int? color,
  }) {
    return FacilitiesModel(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'icon': icon,
      'name': name,
      'color': color,
    };
  }

  factory FacilitiesModel.fromMap(Map<String, dynamic> map) {
    return FacilitiesModel(
      id: map['id'],
      icon: map['icon'],
      name: map['name'],
      color: map['color'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FacilitiesModel.fromJson(String source) => FacilitiesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FacilitiesModel(id: $id, icon: $icon, name: $name, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FacilitiesModel &&
      other.id == id &&
      other.icon == icon &&
      other.name == name &&
      other.color == color;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      icon.hashCode ^
      name.hashCode ^
      color.hashCode;
  }
}
