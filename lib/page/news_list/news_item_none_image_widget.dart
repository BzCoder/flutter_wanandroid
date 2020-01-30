import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'news_list_entity.dart';
import 'package:flutter_wanandroid/res/styles.dart';
import 'package:html_unescape/html_unescape.dart';

/// 文章列表Item 无图模式
///
/// author : BaoZhou
/// date : 2020-1-16 1:09
class NewsListNoneImageWidget extends StatefulWidget {
  final NewsItemEntity itemBean;
  final bool isTopNews;

  NewsListNoneImageWidget(this.itemBean, {this.isTopNews = false});

  @override
  _NewsListNoneImageWidgetState createState() =>
      _NewsListNoneImageWidgetState();
}

class _NewsListNoneImageWidgetState extends State<NewsListNoneImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.isTopNews ? 110.0 : 100.0,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
              child: Stack(
                children: <Widget>[
                  Align(
                    child: Text(
                      HtmlUnescape().convert(widget.itemBean.title),
                      style: TextStyles.textSize16,
                      maxLines: 3,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  Align(
                    child: Text.rich(
                      TextSpan(
                        text: widget.isTopNews ? "置顶  " : "",
                        style: TextStyle(fontSize: 12, color: Colors.red),
                        children: <TextSpan>[
                          TextSpan(
                              text: widget.itemBean.superChapterName +
                                  " / " +
                                  widget.itemBean.chapterName +
                                  "     ",
                              style: TextStyles.textLightGray12),
                          TextSpan(
                            text: widget.itemBean.shareUser +
                                (widget.itemBean.shareUser.isEmpty
                                    ? ""
                                    : " · ") +
                                widget.itemBean.niceShareDate,
                            style: TextStyles.textLightGray12,
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.bottomLeft,
                  )
                ],
              ),
            )),
          ],
        ));
  }
}
