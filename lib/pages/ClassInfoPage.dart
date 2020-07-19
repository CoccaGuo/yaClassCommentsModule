import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterlearn/widget/ClassInfoWidget.dart';
import 'package:flutterlearn/widget/UserCommentWidget.dart';
import '../widget/ScoreDistributePlot.dart';
import '../widget/SendCommentWidget.dart';

class ClassInfoPage extends StatefulWidget {
  @override
  _ClassInfoPageState createState() => _ClassInfoPageState();
}

class _ClassInfoPageState extends State<ClassInfoPage> {
  String demoClassInfoJson = "assets/demo_data.json";
  Map classInfo;
  List scoreList;
  List commentList;
  static final int widgetCounts = 3; //评论控件以外的控件数目，需要单独加载数据

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: ListView.builder(
              itemCount:
                  commentList == null ? 0 : commentList.length + widgetCounts,
              itemBuilder: (BuildContext context, int pos) {
                return _getWidgetData(context, pos);
              },
              ),
      ),
    );
  }

  ///加载数据资源(io) 初始化
  void _initialize() async {
    // io处理
    classInfo = json.decode(await _loadAssets(demoClassInfoJson));
    Map commentInfo = json.decode(await _loadAssets(classInfo["comments"]));
    Map scoreMap = json.decode(await _loadAssets(classInfo["score_distribute"]));
    scoreList = scoreMap["distribute_data"];
    commentList = commentInfo["comment_data"];
  }

  ///下拉手势 刷新界面
  Future _refresh() async {
    setState(() {
      _initialize();
    });
    return;
  }

  ///读取本地json文件
  Future<String> _loadAssets(path) async {
    return await rootBundle.loadString(path);
  }

  ///加载组件
  // ignore: missing_return
  Widget _getWidgetData(BuildContext context, int pos) {
    if (pos < widgetCounts) {
      switch (pos) {
        case 0:
          //加载课程信息组件
            return ClassInfoWidget(
              classInfo["class_title"],
              classInfo["class_id"],
              classInfo["class_title_en"],
              classInfo["class_credit"],
              classInfo["class_hours"],
              classInfo["class_open_semesters"],
              classInfo["class_teacher"],
              classInfo["class_proper_time"],
              classInfo["class_department"],
              classInfo["class_module"],
            );
        case 1:
          //加载成绩分布组件
          return ScoreDistributePlot(scoreList);
        case 2:
          //加载发表评论相关组件
          return SendCommentWidget();
      }
    } else
      //加载评论组件
      return UserCommentWidget(
          this.commentList[pos - widgetCounts]["user_info"]["user_name"],
          this.commentList[pos - widgetCounts]["user_info"]["user_level"],
          this.commentList[pos - widgetCounts]["user_info"]["user_avatar"],
          this.commentList[pos - widgetCounts]["user_info"]["user_id"],
          this.commentList[pos - widgetCounts]["comment_time"],
          this.commentList[pos - widgetCounts]["comment_title"],
          this.commentList[pos - widgetCounts]["comment_content"],
          this.commentList[pos - widgetCounts]["comment_good_count"],
          this.commentList[pos - widgetCounts]["comment_bad_count"]);
  }
}
