import 'package:cat_breeds/infrastructure/locator/service.locator.dart';
import 'package:cat_breeds/ui/framework/dialog/dialogs.service.dart';
import 'package:cat_breeds/ui/framework/provider/base.view.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewModelConsumer<T extends BaseViewModel> extends StatelessWidget {
  final Color? progressColor;
  final bool showProgress;
  final Widget? progressIndicator;
  final Widget Function(BuildContext context, T value) builder;
  final DialogsService _dialogsService = serviceLocator<DialogsService>();

  ViewModelConsumer({
    required this.builder,
    this.progressColor,
    this.progressIndicator,
    this.showProgress = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    _dialogsService.changeContext(context);
    return Consumer<T>(
      builder: (context, model, _) {
        switch (model.state) {
          case NotifierState.loading:
            return this.showProgress
                ? this.progressIndicator ?? _standardProgress()
                : builder(context, model);
          case NotifierState.loaded:
          default:
            return builder(context, model);
        }
      },
    );
  }

  Widget _standardProgress() {
    return Center(
        child: CircularProgressIndicator(
      color: progressColor,
    ));
  }
}
