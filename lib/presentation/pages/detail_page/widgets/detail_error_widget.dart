import 'package:flutter/material.dart';

import '../../../shared/error_message_widget.dart';
import '../../../theme/app_color.dart';

class DetailPageErrorWidget extends StatelessWidget {
  final String errorMessage;
  const DetailPageErrorWidget({required this.errorMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  "assets/icons/arrow_back.png",
                  color: AppColor.grayscaleDark,
                  height: 24,
                )),
          ),
          Expanded(
              child: Center(
                  child: ErrorMessageWidget(
                    errorMessage: errorMessage,
                  ))),
        ],
      ),
    );
  }
}
