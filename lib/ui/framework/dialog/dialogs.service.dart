import 'package:cat_breeds/infrastructure/localization/locale.utils.dart';
import 'package:cat_breeds/infrastructure/locator/service.locator.dart';
import 'package:cat_breeds/styles/text.styles.dart';
import 'package:cat_breeds/ui/framework/messages/message.dart';
import 'package:cat_breeds/ui/framework/messages/messages.service.dart';
import 'package:flutter/material.dart';

class DialogsService with MessagesListener {
  BuildContext? _context;
  bool _isProgressVisible = false;

  DialogsService() {
    serviceLocator<MessagesService>().addListener(this);
  }

  void _hideProgress() {
    if (_isProgressVisible) {
      _isProgressVisible = false;
      Navigator.pop(_context!);
    }
  }

  void _showDialog(String title, Message msg) {
    _hideProgress();
    showDialog(
      context: _context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(msg.text, style: TextStyles.normalStyle),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "OK",
                style: TextStyles.normalStyle,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  void onError(Message message) {
    debugPrint(_context!.loc().error);
    _showDialog(_context!.loc().unexpected_error, message);
  }

  @override
  void onInfo(Message message) {
    _showDialog(_context!.loc().information, message);
  }

  @override
  void onWarning(Message message) {
    _showDialog(_context!.loc().warning, message);
  }

  void changeContext(BuildContext context) {
    _context = context;
  }
}
