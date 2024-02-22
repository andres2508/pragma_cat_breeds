import 'package:cat_breeds/infrastructure/locator/service.locator.dart';
import 'package:cat_breeds/ui/framework/failure.model.dart';
import 'package:cat_breeds/ui/framework/messages/messages.service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

enum NotifierState { initial, loading, loaded }

abstract class BaseViewModel extends ChangeNotifier {
  final MessagesService _messagesService = serviceLocator<MessagesService>();
  NotifierState _state = NotifierState.initial;
  Failure? _failure;

  NotifierState get state => _state;

  bool get isLoading => _state == NotifierState.loading;
  Failure? get failure => _failure;

  bool get hasError => failure != null;

  void _setState(NotifierState state) {
    _state = state;
    notifyUI();
  }

  void notifyUI() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void loadStarted() {
    _setState(NotifierState.loading);
  }

  void loadEnded() {
    _setState(NotifierState.loaded);
  }

  void setFailure(Failure failure, dynamic e, StackTrace stacktrace) {
    debugPrint("Error in base view model \n$e \n$stacktrace");
    _failure = failure;
    notifyUI();
  }

  void _resetFailure() {
    _failure = null;
  }

  Future<void> run(Function body) async {
    try {
      _resetFailure();
      loadStarted();
      await body.call();
    } catch (e, stacktrace) {
      setFailure(Failure.of(e.toString()), e, stacktrace);
    } finally {
      loadEnded();
    }
  }

  Future<void> runWithHandlingError(Function body) async {
    try {
      _resetFailure();
      loadStarted();
      await body.call();
    } catch (error, stacktrace) {
      setFailure(Failure.of(error.toString()), error, stacktrace);
      _messagesService.fireError(error.toString());
    } finally {
      loadEnded();
    }
  }
}
