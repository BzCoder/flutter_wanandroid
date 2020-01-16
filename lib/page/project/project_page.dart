import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/page/news_list/news_list_page.dart';
import 'package:flutter_wanandroid/page/project/project_model.dart';
import 'package:flutter_wanandroid/page/project/project_tree_entity.dart';
import 'package:flutter_wanandroid/provider/provider_widget.dart';
import 'package:flutter_wanandroid/provider/view_state_widget.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/styles.dart';
import 'package:flutter_wanandroid/util/theme_utils.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';



/// 项目主页
///
/// author : BaoZhou
/// date : 2020-01-15 20:21
class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with AutomaticKeepAliveClientMixin {
  ValueNotifier<int> valueNotifier;
  TabController tabController;

  @override
  void initState() {
    valueNotifier = ValueNotifier(0);
    super.initState();
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ProjectCategoryModel>(
      model: ProjectCategoryModel(),
      onModelReady: (model) {
        model.initData();
      },
      builder: (context, model, child) {
        if (model.busy) {
          return ViewStateBusyWidget();
        }
        if (model.error) {
          return ViewStateErrorWidget(
              error: model.viewStateError, onPressed: model.initData);
        }
        List<ProjectTreeEntity> treeList = model.list;
        var primaryColor = Theme.of(context).primaryColor;
        return ValueListenableProvider<int>.value(
          value: valueNotifier,
          child: DefaultTabController(
            length: model.list.length,
            initialIndex: valueNotifier.value,
            child: Builder(
              builder: (context) {
                if (tabController == null) {
                  tabController = DefaultTabController.of(context);
                  tabController.addListener(() {
                    valueNotifier.value = tabController.index;
                  });
                }
                return Scaffold(
                  appBar: AppBar(
                    titleSpacing: 0,
                    title: TabBar(
                        labelStyle: TextStyles.textBold18,
                        labelColor: Theme.of(context).primaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        unselectedLabelColor: ThemeUtils.isDark(context) ? Colours.text_gray : Colours.text,
                        unselectedLabelStyle:TextStyles.textDarkGray14,
                        isScrollable: true,
                        tabs: List.generate(
                            treeList.length,
                                (index) => Tab(
                              text: HtmlUnescape().convert(treeList[index].name),
                            )))
                  ),
                  body: TabBarView(
                    children: List.generate(treeList.length,
                        (index) => NewsListPage(treeList[index].id),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
