import 'package:assignment_lufick/core/ui.dart';
import 'package:flutter/cupertino.dart';

class LinkButton extends StatelessWidget {
  final Function()? function;
  final String buttonName;
  final Color? color;
  const LinkButton(
      {super.key, this.function, required this.buttonName, this.color});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: function,
      child: Text(
        buttonName,
        style: TextStyle(
          color: color ?? AppColors.acccent,
        ),
      ),
    );
  }
}
