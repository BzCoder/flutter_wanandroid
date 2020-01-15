import 'package:flutter/cupertino.dart';

import 'news_list_entity.dart';


class NewsListWidget extends StatefulWidget {
  final NewsBean itemBean;
  NewsListWidget(this.itemBean);

  @override
  _NewsListWidgetState createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.itemBean.title),
    );
  }
}
