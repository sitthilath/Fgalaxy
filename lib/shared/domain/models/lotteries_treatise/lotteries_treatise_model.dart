import 'package:equatable/equatable.dart';

class LotteriesTreatise extends Equatable {
  final int id;
  final String name;
  final String? imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Digit> digits;

  const LotteriesTreatise({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.digits,
  });



  factory LotteriesTreatise.fromJson(Map<String, dynamic> json) =>
      LotteriesTreatise(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        digits: List<Digit>.from(json["digits"].map((x) => Digit.fromJson(x))),
      );



  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "digits": List<dynamic>.from(digits.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [id, name, imageUrl, createdAt, updatedAt, digits];
}

class Digit {
  final int id;
  final String digit;
  final DateTime createdAt;
  final DateTime updatedAt;

  Digit({
    required this.id,
    required this.digit,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Digit.fromJson(Map<String, dynamic> json) => Digit(
        id: json["id"],
        digit: json["digit"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "digit": digit,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
