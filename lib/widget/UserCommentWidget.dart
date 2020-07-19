import 'package:flutter/material.dart';
import 'package:flutterlearn/widget/UserAccountAvatar.dart';
import 'package:flutterlearn/widget/UserCommentStatusBar.dart';

class UserCommentWidget extends StatelessWidget {
 final String accountName;
 final String accountLevel;
 final String avatarUrl;
 final String accountID;
 final String postTime;
 final String title;
 final String content;
 final int goodCount;
 final int badCount;

 UserCommentWidget(this.accountName, this.accountLevel, this.avatarUrl,this.accountID, this.postTime, this.title, this.content, this.goodCount, this.badCount);

  @override
  Widget build(BuildContext context) {
    return Card(
        child:
         Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(child: UserCommentAccountAvatar(accountName, accountLevel,avatarUrl,accountID),width: 70, height: 114,),
              Expanded(child:ListTile(title:Text(title),subtitle: Text(content)))
            ],
          ),
            UserCommentStatusBar(postTime,goodCount,badCount),
          ],
      ),
    ));
  }
}
