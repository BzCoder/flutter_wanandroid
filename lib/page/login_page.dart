import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/gaps.dart';
import 'package:flutter_wanandroid/res/styles.dart';
import 'package:flutter_wanandroid/util/toast.dart';
import 'package:flutter_wanandroid/util/utils.dart';
import 'package:flutter_wanandroid/widget/text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("用户登录")),
        body: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '用户登录',
                    style: TextStyles.textBold26,
                  ),
                  MyTextField(
                    focusNode: _nameFocusNode,
                    config: Utils.getKeyboardActionsConfig(context, [_nameFocusNode, _passwordFocusNode]),
                    controller: _nameController,
                    maxLength: 11,
                    keyboardType: TextInputType.phone,
                    hintText: '请输入手机号',
                  ),
                  Gaps.vGap8,
                  MyTextField(
                    focusNode: _passwordFocusNode,
                    controller: _passwordController,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    hintText: '请输入验证码',
                    getVCode: () {
                      Toast.show('获取验证码');
                      return Future.value(true);
                    },
                  ),
                ])));
  }
}
