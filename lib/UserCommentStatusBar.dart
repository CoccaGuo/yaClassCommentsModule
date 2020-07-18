import 'package:flutter/material.dart';

///点赞、反对、发表时间区
class UserCommentStatusBar extends StatefulWidget {
  final String commentTime;//评论时间
  final int goodCount;//赞成数
  final int badCount;//反对数
  UserCommentStatusBar(this.commentTime, this.goodCount, this.badCount);

  @override
  _StatusBarState createState() => _StatusBarState(goodCount,badCount);
}

class _StatusBarState extends State<UserCommentStatusBar> {
  int goodCount;
  int badCount;
  _StatusBarState(this.goodCount, this.badCount);

  @override
  Widget build(BuildContext context) {
    var cmtTimeWidget = Text(widget.commentTime,style: TextStyle(color: Colors.black54,fontSize: 12),);
    var goodCountWidget = InkWell(child:Container(padding:EdgeInsets.all(5.0),child:Text("赞成($goodCount)",style: TextStyle(color: Colors.teal,fontSize: 12))),onTap: (){
      setState(() {
        goodCount++;
      });
    },);
    var badCountWidget = InkWell(child:Container(padding:EdgeInsets.all(5.0),child:Text("反对($badCount)",style: TextStyle(color: Colors.red,fontSize: 12))),onTap: (){
      setState(() {
        badCount++;
      });
    },);
    return Container(
      height: 25,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 2, end:20),
        child: Stack(
          children: <Widget>[
            Align(child:cmtTimeWidget, alignment: Alignment.centerLeft,),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  goodCountWidget,
                  SizedBox(width: 12),
                  badCountWidget
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

