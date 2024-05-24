import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alarm_app/core/utils/app_colors.dart';

class CachedNetworkImageDesign extends StatelessWidget {
  final String url;
  final double? height, width ;
  final  BorderRadiusGeometry ? radius;

  const CachedNetworkImageDesign(
      {super.key, required this.url, this.height, this.width, this.radius});

  @override
  Widget build(BuildContext context) {
    if (url.contains(".svg")) {
      return SizedBox(
        height: height,
        width: width,
        child: SvgPicture.network(url),
      );
    }
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: radius,
          //shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.primary)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
