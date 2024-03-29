import 'package:flutter/material.dart';

class CustomBookImageLoadingIndicator extends StatelessWidget {
  const CustomBookImageLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5.6 / 7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.grey[50],
        ),
      ),
    );
  }
}
