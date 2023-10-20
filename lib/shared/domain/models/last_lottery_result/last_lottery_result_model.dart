class LastLotteryResult {
  final int id;
  final int drawId;
  final int number;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<LotteryResult> lotteryResults;

  LastLotteryResult({
    required this.id,
    required this.drawId,
    required this.number,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.lotteryResults,
  });

  factory LastLotteryResult.fromJson(Map<String, dynamic> json) =>
      LastLotteryResult(
        id: json["id"],
        drawId: json["draw_id"],
        number: json["number"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        lotteryResults: List<LotteryResult>.from(
            json["lottery_results"].map((x) => LotteryResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "draw_id": drawId,
        "number": number,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "lottery_results":
            List<dynamic>.from(lotteryResults.map((x) => x.toJson())),
      };
}

class LotteryResult {
  final int id;
  final String digitType;
  final String lotteryType;
  final String value;
  final DateTime createdAt;
  final DateTime updatedAt;

  LotteryResult({
    required this.id,
    required this.digitType,
    required this.lotteryType,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LotteryResult.fromJson(Map<String, dynamic> json) => LotteryResult(
        id: json["id"],
        digitType: json["digit_type"],
        lotteryType: json["lottery_type"],
        value: json["value"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "digit_type": digitType,
        "lottery_type": lotteryType,
        "value": value,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
