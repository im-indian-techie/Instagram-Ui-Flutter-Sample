
import 'package:json_annotation/json_annotation.dart';
part 'myItem.g.dart';
@JsonSerializable()
class MyItem
{
  String id;
  String channelname;
  String title;
  String high_thumbnail;
  String low_thumbnail;
  String medium_thumbnail;
  List tags;

  MyItem(this.id, this.channelname, this.title, this.high_thumbnail,
      this.low_thumbnail, this.medium_thumbnail, this.tags);

}