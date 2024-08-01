import 'package:flutter/material.dart';

abstract class CustomScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Color backgroundColor;

  const CustomScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.backgroundColor = Colors.grey,
  }) : super(key: key);
}
