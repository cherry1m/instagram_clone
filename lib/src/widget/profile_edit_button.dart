import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileEditButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const ProfileEditButton(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 40,
        child: CupertinoButton(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            color: CupertinoColors.systemGrey4,
            onPressed: onPressed,
            child: child));
  }
}
