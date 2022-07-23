import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: const Text('Learning App'),
      centerTitle: true,
    );
  }
}
