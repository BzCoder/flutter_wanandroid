import 'package:json_annotation/json_annotation.dart';

part 'project_tree_entity.g.dart';

/// 项目菜单
///
/// author : BaoZhou
/// date : 2020-01-15 20:21
@JsonSerializable()
class ProjectTreeEntity extends Object {

  @JsonKey(name: 'children')
  List<dynamic> children;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'parentChapterId')
  int parentChapterId;

  @JsonKey(name: 'userControlSetTop')
  bool userControlSetTop;

  @JsonKey(name: 'visible')
  int visible;

  ProjectTreeEntity(this.children,this.courseId,this.id,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory ProjectTreeEntity.fromJson(Map<String, dynamic> srcJson) => _$ProjectTreeEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectTreeEntityToJson(this);

}


