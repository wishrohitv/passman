import 'package:bot_toast/bot_toast.dart';

void showToast(String msg, {int? duration, int? gravity}) {
  BotToast.showText(text: msg);
}
void showNotification(String msg, {int? duration, int? gravity}) {
  BotToast.showSimpleNotification(title: msg);
}
