import 'package:flutter/cupertino.dart';
import 'news_list_entity.dart';
import 'package:flutter_wanandroid/res/styles.dart';
import 'package:html_unescape/html_unescape.dart';

/// 文章列表Item
///
/// author : BaoZhou
/// date : 2020-1-16 1:09
class NewsListWidget extends StatefulWidget {
  final NewsBean itemBean;

  NewsListWidget(this.itemBean);

  @override
  _NewsListWidgetState createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  child: Text(HtmlUnescape().convert(widget.itemBean.title),
                    style: TextStyles.textBold18,
                    maxLines: 3),
                )
    ),
          Expanded(
            flex: 2,
              child: Container(
                child: Text(HtmlUnescape().convert(widget.itemBean.title),
                    style: TextStyles.textBold18,
                    maxLines: 3),
              )
          )
        ],
    );
  }
}
