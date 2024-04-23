import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_color.dart';

class PokemonImageWidget extends StatelessWidget {
  final double size;
  final String imageUrl;
  const PokemonImageWidget({required this.size, required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: size,
      height: size,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          width: size,
          height: size,
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Icon(Icons.broken_image_rounded, color: AppColor.grayscaleLight, size: size,);
      },
    );
  }
}