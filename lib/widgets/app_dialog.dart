import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'custom_screen_related.dart';

showErrorDialog({context, body, redirection = false, Function()? redirect}) {
  print('alert');
  alertConfirmation(
    context: context,
    title: 'eMedicare Match',
    body: body,
    onChange: () {
      if (redirection) {
        redirect!();
      } else {
        Navigator.pop(context);
      }
    },
  );
}

Future<void> alertConfirmation({
  required BuildContext context,
  required String title,
  required String body,
  required Function() onChange,
}) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Column(
          children: [
            const SizedBox(height: 15),
            appText(
              title,
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
              fontSize: TextSize.NORMAL,
            ),
            const SizedBox(height: 15),
            appText(
              body,
              color: AppColors.cyan,
              fontSize: TextSize.NORMAL,
              align: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                onChange();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(
                      color: Color.fromARGB(225, 48, 55, 121),
                    ),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: appText(
                  'Close',
                  color: const Color.fromARGB(225, 48, 55, 121),
                  fontSize: TextSize.NORMAL,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
