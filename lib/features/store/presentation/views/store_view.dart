import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

import '../widgets/store_view_body.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});
  static const routeName = 'store_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: const StoreViewBody().withHorizontalPadding(30),
      ),
    );
  }
}
