import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {

  const CustomNetworkImage({
    super.key,
    this.imageUrl,
    this.boxShape,
    required this.height,
    required this.width,
    this.fit,
    this.placeholderImagePath
  }) : assert(imageUrl != null || placeholderImagePath != null, 'Either image URL must be provided or asset image'),
      assert(imageUrl == null || placeholderImagePath == null, 'Both Image URL and asset image cannot be provided');

  final String? imageUrl;
  final BoxShape? boxShape;
  final double height, width;
  final BoxFit? fit;
  final String? placeholderImagePath;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imageUrl ?? '',
      imageBuilder: (context, imageProvider) {
        return boxShape == null ? ClipRRect(
          borderRadius: kBorderRadius,
          child: Image(image: imageProvider),
        ) : Container(
          decoration: BoxDecoration(
            shape: boxShape!,
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return ClipRRect(
          borderRadius: kBorderRadius,
          child: Image.asset(placeholderImagePath ?? 'assets/icons/image_error.png', fit: BoxFit.cover,),
        );
      },
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator(strokeWidth: 2.0),
        );
      },
    );
  }
}
