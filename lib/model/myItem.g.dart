// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyItem _$MyItemFromJson(Map<String, dynamic> json) {
  return MyItem(
    json['id'] as String,
    json['channelname'] as String,
    json['title'] as String,
    json['high_thumbnail'] as String,
    json['low_thumbnail'] as String,
    json['medium_thumbnail'] as String,
    json['tags'] as List<dynamic>,
  );
}

Map<String, dynamic> _$MyItemToJson(MyItem instance) => <String, dynamic>{
      'id': instance.id,
      'channelname': instance.channelname,
      'title': instance.title,
      'high_thumbnail': instance.high_thumbnail,
      'low_thumbnail': instance.low_thumbnail,
      'medium_thumbnail': instance.medium_thumbnail,
      'tags': instance.tags,
    };
