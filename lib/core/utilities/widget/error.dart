import 'package:dfa_media/app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorIcon extends StatelessWidget {
  const ErrorIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.error,
        color: AppColors.kThirdColor,
        size: 54,
      ),
    );
  }
}