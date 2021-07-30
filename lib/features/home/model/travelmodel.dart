import 'dart:convert';

class TravelAvatarModel {
  int? id;
  String? image;
  TravelAvatarModel({
    this.id,
    this.image,
  });

  TravelAvatarModel copyWith({
    int? id,
    String? image,
  }) {
    return TravelAvatarModel(
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
    };
  }

  factory TravelAvatarModel.fromMap(Map<String, dynamic> map) {
    return TravelAvatarModel(
      id: map['id'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TravelAvatarModel.fromJson(String source) =>
      TravelAvatarModel.fromMap(json.decode(source));

  @override
  String toString() => 'TravelAvatarModel(id: $id, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TravelAvatarModel && other.id == id && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode;
}
