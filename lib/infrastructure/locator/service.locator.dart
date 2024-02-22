import 'package:cat_breeds/ui/framework/dialog/dialogs.service.dart';
import 'package:cat_breeds/ui/framework/messages/messages.service.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Infrastructure Services
  serviceLocator.registerSingleton(MessagesService());
  serviceLocator.registerSingleton(DialogsService());
  // Domain Services
}
