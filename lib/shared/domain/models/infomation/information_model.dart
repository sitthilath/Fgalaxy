import 'package:equatable/equatable.dart';

class Information extends Equatable{
 final int id;
 final String name;
 final String imageUrl;
 final String newsLink;
 final String content;
 final DateTime createdAt;
 final DateTime updatedAt;

  const Information({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.newsLink,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Information.fromJson(Map<String, dynamic> json) => Information(
    id: json["id"],
    name: json["name"],
    imageUrl: json["image_url"],
    newsLink: json["news_link"],
    content: json["content"],
    createdAt: DateTime.parse(json['created_at']),
    updatedAt: DateTime.parse(json['updated_at']),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image_url": imageUrl,
    "news_link": newsLink,
    "content": content,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, imageUrl, newsLink, content, createdAt, updatedAt];
}