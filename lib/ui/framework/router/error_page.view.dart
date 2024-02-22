import 'package:cat_breeds/infrastructure/localization/locale.utils.dart';
import 'package:flutter/material.dart';

class ErrorPageView extends StatelessWidget {
  final String _message;
  final Function? retryAction;

  const ErrorPageView(this._message, this.retryAction, {super.key});

  const ErrorPageView.of(this._message, {this.retryAction, super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc();
    final columnChildren = <Widget>[
      const Icon(Icons.warning, size: 42),
      Center(child: Text(loc.unexpected_error)),
      Center(child: Text(_message)),
    ];
    if (retryAction != null) {
      columnChildren.add(ElevatedButton(
        child: Text(loc.retry),
        onPressed: () => retryAction!.call(),
      ));
    }
    final column = Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: columnChildren,
      ),
    );
    return column;
  }
}
