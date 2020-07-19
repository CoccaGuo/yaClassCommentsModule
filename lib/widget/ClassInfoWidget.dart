import 'package:flutter/material.dart';

class ClassInfoWidget extends StatefulWidget {
  final String title;
  final String id;
  final String titleEn;
  final String credit;
  final String hours;
  final String openSemesters;
  final String teacher;
  final String properTime; //一般公选课的时间是固定的
  final String department;
  final String module;

  ClassInfoWidget(
      this.title,
      this.id,
      this.titleEn,
      this.credit,
      this.hours,
      this.openSemesters,
      this.teacher,
      this.properTime,
      this.department,
      this.module);

  @override
  _ClassInfoWidgetState createState() => _ClassInfoWidgetState();
}

class _ClassInfoWidgetState extends State<ClassInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 10,left: 8,right: 8,bottom: 12),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "课程摘要",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ))),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding:EdgeInsets.only(left: 8,top: 4),child:Text("老师：${widget.teacher}",maxLines: 2,)),
                      Padding(padding:EdgeInsets.only(left: 8,top: 4),child:Text("惯用时间：${widget.properTime}",maxLines: 2,)),
                      Padding(padding:EdgeInsets.only(left: 8,top: 4),child:Text("开课单位：${widget.department}")),
                      Padding(padding:EdgeInsets.only(left: 8,top: 4),child:Text("模块：${widget.module}",maxLines: 2,)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding:EdgeInsets.only(left: 8,top: 4),child:Text("学分：${widget.credit}")),
                      Padding(padding:EdgeInsets.only(left: 8,top: 4),child:Text("课时：${widget.hours}")),
                      Padding(padding:EdgeInsets.only(left: 8,top: 4),child:Text("开设学期：${widget.openSemesters}")),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
