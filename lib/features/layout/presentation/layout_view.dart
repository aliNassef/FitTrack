import 'package:flutter/material.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  static const String routeName = 'layout_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(),
          ],
        ),
      ),
    );
  }
}
