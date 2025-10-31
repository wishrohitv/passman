import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class Loader {
  Function? cancel;

  void showLoader(
    BuildContext context, {
    Widget widget = const CircularProgressIndicator(),
  }) {
    // popup a attachments toast
    cancel = BotToast.showAttachedWidget(
      attachedBuilder: (_) => Center(
        child: Card(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget,
          ),
        ),
      ),
      duration: Duration(seconds: 2),
      target: Offset(520, 520),
    );
  }

  void dismiss() {
    cancel!(); //close
  }
}
