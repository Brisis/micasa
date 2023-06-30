import 'package:flutter/widgets.dart';
import 'package:micasa/dialogs/generic_dialog.dart';

Future<bool> showDeleteAccountDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: "Delete Account",
    content:
        "Are you sure you want to delete your account? You cannot undo this operation!",
    optionsBuilder: () => {
      "Cancel": false,
      "Delete Account": true,
    },
  ).then(
    (value) => value ?? false,
  );
}
