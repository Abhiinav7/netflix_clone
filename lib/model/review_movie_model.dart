// To parse this JSON data, do
//
//     final reviewMovieModel = reviewMovieModelFromJson(jsonString);

import 'dart:convert';

ReviewMovieModel reviewMovieModelFromJson(String str) => ReviewMovieModel.fromJson(json.decode(str));

String reviewMovieModelToJson(ReviewMovieModel data) => json.encode(data.toJson());

class ReviewMovieModel {
  int id;
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  ReviewMovieModel({
    required this.id,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory ReviewMovieModel.fromJson(Map<String, dynamic> json) => ReviewMovieModel(
    id: json["id"],
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {
  String author;
  AuthorDetails authorDetails;
  String content;
  DateTime createdAt;
  String id;
  DateTime updatedAt;
  String url;

  Result({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    author: json["author"],
    authorDetails: AuthorDetails.fromJson(json["author_details"]),
    content: json["content"],
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "author_details": authorDetails.toJson(),
    "content": content,
    "created_at": createdAt.toIso8601String(),
    "id": id,
    "updated_at": updatedAt.toIso8601String(),
    "url": url,
  };
}

class AuthorDetails {
  String name;
  String username;
  String? avatarPath;
  int rating;

  AuthorDetails({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
    name: json["name"],
    username: json["username"],
    avatarPath: json["avatar_path"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "avatar_path": avatarPath,
    "rating": rating,
  };
}
