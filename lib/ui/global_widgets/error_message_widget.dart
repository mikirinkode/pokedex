import 'package:flutter/material.dart';

import '../../core/theme/app_color.dart';
import '../../core/theme/app_typography.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String errorMessage;

  const ErrorMessageWidget({required this.errorMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Icon(Icons.error, color: AppColor.primary, size: 35,),
          const SizedBox(height: 24,),
          Text("Terjadi Kesalahan", style: AppTypography.subtitle1),
          const SizedBox(height: 8,),
          Text(errorMessage, textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
