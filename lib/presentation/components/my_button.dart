import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool isDisabled;
  final Color? color;

  const MyButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.color,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          //take the width of the parent widget

          child: MaterialButton(
            onPressed: isDisabled ? null : onTap,
            color: isDisabled ? Colors.grey : color ?? Get.theme.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 42,
            textTheme: ButtonTextTheme.primary,

            // minWidth: MediaQuery.of(context).size.width*0.9,
            child: Text(text),
          ),
        ),
      ],
    );
  }
}
