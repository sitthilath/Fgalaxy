import 'package:galaxy_18_lottery_app/shared/globals.dart';

class PaginatedResponse<T> {
  final int cursor;
  static const  int pageSize = LIMIT_PAGE_SIZE;
  final List<T> data;

  PaginatedResponse({this.cursor = 0, required this.data});

  factory PaginatedResponse.fromJson(dynamic json, List<T> data, {Function(dynamic json)? fixture}) =>
      PaginatedResponse(
        cursor: json['cursor'] ?? 0,
        data: data,
      );

  @override
  String toString() {
    return 'PaginatedResponse(cursor:$cursor, data:${data.length})';
  }
}