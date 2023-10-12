import 'package:equatable/equatable.dart';

class DreamTreatise extends Equatable {
  final int id;
  final String description;
  final DateTime createdAt;
  final List<DreamDigits> dreamDigits;
  final LotteryTreatise lotteryTreatise;

  const DreamTreatise({
    required this.id,
    required this.description,
    required this.lotteryTreatise,
    required this.dreamDigits,
    required this.createdAt,
  });

  factory DreamTreatise.fromJson(Map<String, dynamic> json) {
    return DreamTreatise(
      id: json['id'],
      description: json['description'],
      lotteryTreatise: LotteryTreatise.fromJson(json['lottery_treatise']),
      dreamDigits: List<DreamDigits>.from(
          json['dreams_digits'].map((json) => DreamDigits.fromJson(json))),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, description, lotteryTreatise, dreamDigits, createdAt];

  String toStringDigit(List<DreamDigits> dreamDigits) {
    List<String> digits =
        dreamDigits.map((item) => item.digit.toString()).toList();
    return digits.join(', ');
  }
}

class DreamDigits {
  final int id;
  final String digit;
  final DateTime createdAt;

  DreamDigits({
    required this.id,
    required this.digit,
    required this.createdAt,
  });

  factory DreamDigits.fromJson(Map<String, dynamic> json) => DreamDigits(
        id: json['id'],
        digit: json['digit'],
        createdAt: DateTime.parse(json['created_at']),
      );
}

class LotteryTreatise {
  final int id;
  final String name;
  final dynamic imageUrl;
  final DateTime createdAt;
  final List<Digits> digits;

  LotteryTreatise({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.imageUrl,
    required this.digits,
  });

  factory LotteryTreatise.fromJson(Map<String, dynamic> json) =>
      LotteryTreatise(
        id: json['id'],
        createdAt: DateTime.parse(json['created_at']),
        name: json['name'],
        imageUrl: json['image_url'],
        digits: List<Digits>.from(
            json['digits'].map((json) => Digits.fromJson(json))),
      );
}

class Digits {
  final int id;
  final String digit;
  final DateTime createdAt;

  Digits({
    required this.id,
    required this.digit,
    required this.createdAt,
  });

  factory Digits.fromJson(Map<String, dynamic> json) => Digits(
      id: json['id'],
      digit: json['digit'],
      createdAt: DateTime.parse(json['created_at']));
}
