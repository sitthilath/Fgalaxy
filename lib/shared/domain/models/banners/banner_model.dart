import 'package:equatable/equatable.dart';

class Banner extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String bannerLink;

  const Banner({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.bannerLink,
  });

  @override
  List<Object?> get props => [id, title, description, imageUrl, bannerLink];

  Banner copyWith({
    int? id,
    String? title,
    String? description,
    String? imageUrl,
    String? bannerLink,
  }) {
    return Banner(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      bannerLink: bannerLink ?? this.bannerLink,
    );
  }

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["image_url"],
        bannerLink: json["banner_link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image_url": imageUrl,
        "banner_link": bannerLink,
      };
}
