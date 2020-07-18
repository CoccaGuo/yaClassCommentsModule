import 'package:flutter/material.dart';

///圆角头像框
class _AccountAvatar extends StatelessWidget {
  ///头像Widget
  final Widget accountAvatar;
  final width;
  _AccountAvatar(this.accountAvatar, {this.width = 64.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 2, end: 2),
        child: Container(
          width: 56,
          height: 56,
          child: accountAvatar,
        ),
      ),
    );
  }
}

class _AccountDetails extends StatelessWidget {
  final width;

  ///头像下面的账户信息
  ///第一行：用户名
  final Widget accountName;

  ///第二行：用户等级或者其他附加信息
  final Widget accountLevel;
  _AccountDetails(this.accountName, this.accountLevel, {this.width = 64});

  @override
  Widget build(BuildContext context) {
    Widget accountDetails = Container(
        width: width,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: accountName,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: accountLevel,
            ),
          ],
        ));
    return accountDetails;
  }
}

///用户头像以及信息的原型类
///默认宽度70，高度最小114左右
class UserAccountAvatar extends StatelessWidget {
  final Widget accountName;
  final Widget accountLevel;
  final Widget accountAvatar;
  final accountID;
  final width;
  final Decoration decoration;

  UserAccountAvatar(
      this.accountName, this.accountLevel, this.accountAvatar, this.accountID,
      {this.width = 70.0, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration ?? null,
      padding: const EdgeInsetsDirectional.only(top: 2),
      child: Column(
        children: <Widget>[
          Padding(
              child: _AccountAvatar(accountAvatar, width: width),
              padding: const EdgeInsetsDirectional.only(bottom: 2)),
          Expanded(
              child: _AccountDetails(accountName, accountLevel, width: width)),
        ],
      ),
    );
  }
}

///评论区使用的实用头像栏
class UserCommentAccountAvatar extends UserAccountAvatar {
  UserCommentAccountAvatar(String accountName, String accountLevel,
      String accountAvatarUrl, String accountID)
      : super(
            Text(accountName,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500), maxLines: 2,overflow: TextOverflow.ellipsis,),
            Text(accountLevel,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            CircleAvatar(
                child: ClipOval(child: Image.network(accountAvatarUrl))),
            accountID);
}
