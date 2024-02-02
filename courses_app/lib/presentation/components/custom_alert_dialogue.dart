// ignore_for_file: unused_import

import 'package:courses_app/constants/color/color.dart';
import 'package:courses_app/core/extension/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future customAlertDialogue({
  required BuildContext context,
  required String msg,
  String? title,
  Icon? icon,
  Widget? actionOne,
  Widget? actionTwo,
}) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const Icon(Icons.warning),
            SizedBox(width: 10.w),
            Text(title ?? 'Info'),
          ],
        ),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        content: Text(msg, textAlign: TextAlign.center),
        contentPadding: EdgeInsets.only(bottom: 0, top: 12.h),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
          actionOne ?? Container(),
          actionTwo ?? Container(),
        ],
        actionsAlignment: MainAxisAlignment.center,
      );
    },
  );
}
