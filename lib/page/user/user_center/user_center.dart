import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/page/user/UserModel.dart';
import 'package:flutter_wanandroid/provider/provider_widget.dart';
import 'package:flutter_wanandroid/util/image_utils.dart';

class UserCenter extends StatefulWidget {
  @override
  _UserCenterState createState() => _UserCenterState();
}

class _UserCenterState extends State<UserCenter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('用户中心'),
    );
//    return ProviderWidget<UserModel>(
//      child: Container(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              Row(
//                children: <Widget>[
//                  CircleAvatar(
//                      radius: 28.0,
//                      backgroundColor: Colors.transparent,
//                      backgroundImage: ImageUtils.getImageProvider(provider.user?.avatarUrl, holderImg: 'shop/tx')
//                  )
//                ],
//              )
//            ],
//          )),
//    );





  }
}
