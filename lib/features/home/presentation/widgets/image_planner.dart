import 'dart:async';

import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';

class ImagePlanner extends StatefulWidget {
  const ImagePlanner({
    super.key,
  });

  @override
  State<ImagePlanner> createState() => _ImagePlannerState();
}

class _ImagePlannerState extends State<ImagePlanner> {
  late Timer _timer;
  int currentIndex = 0;
  final List<String> images = [
    'https://tse1.mm.bing.net/th/id/OIP.prmAxCuWMjN2oLz3K_KsOAHaE8?rs=1&pid=ImgDetMain&o=7&rm=3',
    'https://static.vecteezy.com/system/resources/previews/037/236/104/non_2x/ai-generated-gym-with-many-equipments-free-photo.jpg',
    'https://img.freepik.com/premium-photo/gym-home-inspiration-design-professional-advertising-photography-ai-generated_925376-3194.jpg',
    'https://static.vecteezy.com/system/resources/previews/037/235/090/non_2x/ai-generated-gym-with-many-equipments-free-photo.jpg',
  ];
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (mounted) {
        setState(() {
          currentIndex++;
          if (currentIndex >= 4) {
            currentIndex = 0;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: context.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: CustomNetworkImage(
        radius: 20,
        img: images[currentIndex],
      ),
    );
  }
}
 