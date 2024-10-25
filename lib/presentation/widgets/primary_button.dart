import 'package:assignment_lufick/core/ui.dart';
import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonName;
  final Function()? function;
  final Color? color;
  const PrimaryButton(
      {super.key, required this.buttonName, this.function, this.color});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: function,
      color: color ?? AppColors.acccent,
      child: Text(buttonName),
    );
  }
}
