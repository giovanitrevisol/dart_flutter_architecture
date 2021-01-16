import 'package:clean_architecture_flutter/modules/app_modular.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
    ),
  );
}
