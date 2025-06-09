import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

import '../widgets/progress_photo_view_body.dart';

class ProgressPhotoView extends StatelessWidget {
  const ProgressPhotoView({super.key});

  static const String routeName = 'progress_photo_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const ProgressPhotoViewBody().withHorizontalPadding(30),
      ),
    );
  }
}
