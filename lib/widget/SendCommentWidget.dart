import 'package:flutter/material.dart';

class SendCommentWidget extends StatefulWidget {
  @override
  _SendCommentWidgetState createState() => _SendCommentWidgetState();
}

class _SendCommentWidgetState extends State<SendCommentWidget> {
  var inputTitleController = TextEditingController();
  var inputFieldController = TextEditingController();
  var inputAnonymous = false;
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
            padding: EdgeInsets.only(bottom: 4, left: 4, right: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  width: double.infinity,
                  child: TextField(
                    controller: inputTitleController,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: "题目",
                    ),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  width: double.infinity,
                  child: TextField(
                    controller: inputFieldController,
                    maxLines: 4,
                    autofocus: false,
                    //设置键盘按钮为发送
//                      textInputAction: TextInputAction.send,
//                        onEditingComplete:(){print(inputFieldController.text);},
                    decoration: InputDecoration(
                      hintText: "发表评论，表达自己...",
//                          border: OutlineInputBorder()
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Switch(
                            activeColor: Theme.of(context).accentColor,
                            value: this.inputAnonymous,
                            onChanged: (b) => this.setState(() {
                              this.inputAnonymous = !this.inputAnonymous;
                            }),
                          )),
                      Align(
                          alignment: Alignment.centerLeft, child: Text("匿名发表")),
                      SizedBox(
                        width: 24,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            color: Theme.of(context).buttonColor,
                            child: Text("发表"),
                            onPressed: _sendComment,
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  void _sendComment() {
    print(this.inputTitleController.text);
    print(this.inputFieldController.text);
    print(this.inputAnonymous.toString());
  }
}
