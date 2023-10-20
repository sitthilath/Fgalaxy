
class CurrentDrawLottery{
  final int id;
  final int drawId;
  final int number;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  CurrentDrawLottery({
    required this.id,
    required this.drawId,
    required this.number,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CurrentDrawLottery.fromJson(Map<String, dynamic> json) =>
      CurrentDrawLottery(
        id: json["id"],
        drawId: json["draw_id"],
        number: json["number"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "draw_id": drawId,
        "number": number,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
