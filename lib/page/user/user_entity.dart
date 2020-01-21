import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

/// 用户数据结构
///
/// author : BaoZhou
/// date : 2020-01-19 18:49
@JsonSerializable()
class UserEntity extends Object {

  @JsonKey(name: 'admin')
  bool admin;

  @JsonKey(name: 'chapterTops')
  List<dynamic> chapterTops;

  @JsonKey(name: 'collectIds')
  List<dynamic> collectIds;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'publicName')
  String publicName;

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'username')
  String username;

  UserEntity(this.admin,this.chapterTops,this.collectIds,this.email,this.icon,this.id,this.nickname,this.password,this.publicName,this.token,this.type,this.username,);

  factory UserEntity.fromJson(Map<String, dynamic> srcJson) => _$UserEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

}


