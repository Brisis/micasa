import 'package:flutter/widgets.dart';
import 'package:micasa/dialogs/generic_dialog.dart';
import 'package:micasa/models/auth_error.dart';

Future<void> showAuthErrorDialog({
  required AuthError authError,
  required BuildContext context,
}) {
  return showGenericDialog<void>(
    context: context,
    title: authError.dialogTitle,
    content: authError.dialogText,
    optionsBuilder: () => {
      "Ok": true,
    },
  );
}
