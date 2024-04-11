import 'package:flutter/material.dart';
import 'package:tomato_timer/app/app.dart';
import 'package:tomato_timer/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
