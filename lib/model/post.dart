
import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Post
{

  String id;
  String channelname;
  String title;
  String high_thumbnail;
  String low_thumbnail;
  String medium_thumbnail;
  List tags;


  Post({required this.id, required this.channelname, required this.title, required this.high_thumbnail,
    required this.low_thumbnail, required this.medium_thumbnail, required this.tags});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    channelname: json["channelname"],
    title: json["title"],
    high_thumbnail: json["high thumbnail"],
    low_thumbnail: json["low thumbnail"],
    medium_thumbnail: json["medium thumbnail"],
    tags: json["tags"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "channelname": channelname,
    "title": title,
    "high thumbnail": high_thumbnail,
    "low thumbnail": low_thumbnail,
    "medium thumbnail": medium_thumbnail,
    "tags": tags,
  };

}