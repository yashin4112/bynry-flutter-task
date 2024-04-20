import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageViewWidget extends StatelessWidget {
  final String imgUrl;
  final String label;
  const ImageViewWidget({super.key, required this.imgUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){},
          child: SvgPicture.asset(imgUrl,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}