import 'package:cat_breeds/app.dart';
import 'package:cat_breeds/infrastructure/auth/authentication.interceptor.dart';
import 'package:cat_breeds/infrastructure/http/http.data_source.dart';
import 'package:cat_breeds/infrastructure/http/http.interceptor.dart';
import 'package:cat_breeds/infrastructure/locator/service.locator.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  _registerInterceptors();
  runApp(PragmaMobileApp());
}

void _registerInterceptors() {
  // Add request interceptors
  HttpInterceptors.addRequestInterceptor(HttpContentTypeRequestInterceptor());
  HttpInterceptors.addRequestInterceptor(AuthenticationInterceptor());
  // Add response interceptors
}
