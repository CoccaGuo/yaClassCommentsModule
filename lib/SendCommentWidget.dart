import 'package:flutter/material.dart';

class SendCommentWidget extends StatefulWidget {
  @override
  _SendCommentWidgetState createState() => _SendCommentWidgetState();
}

class _SendCommentWidgetState extends State<SendCommentWidget> {
  var inputFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("评论区",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 8,
              ),
                  Container(
                    padding: EdgeInsets.only(left: 8,right: 8),
                    width: double.infinity,
                    child: TextField(
                      controller: inputFieldController,
                      maxLines: 4,
                      autofocus: false,
                      //设置键盘按钮为发送
                      textInputAction: TextInputAction.send, 
                        onEditingComplete:(){print(inputFieldController.text);},
                        decoration: InputDecoration(
                          hintText: "发表评论，表达自己...",
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),
            ],
          ),
      )
    );
  }
}

