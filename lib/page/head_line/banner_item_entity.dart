import 'package:json_annotation/json_annotation.dart';

part 'banner_item_entity.g.dart';

@JsonSerializable()
class BannerItemEntity extends Object {
  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'imagePath')
  String imagePath;

  @JsonKey(name: 'isVisible')
  int isVisible;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'url')
  String url;

  BannerItemEntity(
    this.desc,
    this.id,
    this.imagePath,
    this.isVisible,
    this.order,
    this.title,
    this.type,
    this.url,
  );

  factory BannerItemEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$BannerItemEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerItemEntityToJson(this);
}
