import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/widget/load_image.dart';
import 'news_list_entity.dart';
import 'package:flutter_wanandroid/res/styles.dart';
import 'package:html_unescape/html_unescape.dart';

/// 文章列表Item
///
/// author : BaoZhou
/// date : 2020-1-16 1:09
class NewsListWidget extends StatefulWidget {
  final NewsItemEntity itemBean;

  NewsListWidget(this.itemBean);

  @override
  _NewsListWidgetState createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.0,
        padding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: Stack(
                children: <Widget>[
                  Align(
                    child: Text(
                      HtmlUnescape().convert(widget.itemBean.title),
                      style: TextStyles.textBold15,
                      maxLines: 3,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  Align(
                    child: Text(
                      widget.itemBean.author +
                          " · " +
                          widget.itemBean.niceDate,
                      style: TextStyles.textGray12,
                    ),
                    alignment: Alignment.bottomLeft,
                  )
                ],
              ),
            )),
            LoadImage(widget.itemBean.envelopePic, width: 90.0, height: 90.0),
          ],
        ));
  }
}
