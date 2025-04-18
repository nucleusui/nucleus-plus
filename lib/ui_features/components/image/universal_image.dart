import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nucles_app/extension/string.dart';

class UniversalImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final String? fallbackImagePath;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  final BorderRadiusGeometry borderRadius;
  final AlignmentGeometry alignment;

  const UniversalImage(
    this.imagePath, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color,
    this.fallbackImagePath,
    this.errorBuilder,
    this.borderRadius = BorderRadius.zero,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: _buildImage(),
    );
  }

  Widget _buildImage() {
    if (imagePath.isEmpty) {
      return _buildFallbackImage();
    }

    try {
      // Check if the image path is a valid URL
      if (imagePath.isValidUrl) {
        if (imagePath.endsWith('.svg')) {
          return _buildNetworkSvg();
        } else {
          return _buildNetworkImage();
        }
      }

      if (imagePath.endsWith('.svg')) {
        return _buildSvgImage();
      }

      return _buildAssetImage(imagePath);
    } catch (error) {
      return _buildFallbackImage();
    }
  }

  Widget _buildNetworkImage() {
    return Image.network(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return _buildFallbackImage();
      },
      errorBuilder: errorBuilder ??
          (context, error, stackTrace) {
            debugPrint('Error loading network image: $error');
            return _buildErrorPlaceholder();
          },
    );
  }

  Widget _buildNetworkSvg() {
    return SvgPicture.network(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      placeholderBuilder: (context) => _buildFallbackImage(),
    );
  }

  Widget _buildSvgImage() {
    return SvgPicture.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      placeholderBuilder: (context) => _buildFallbackImage(),
    );
  }

  Widget _buildAssetImage(String path) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment: alignment,
      errorBuilder: errorBuilder ??
          (context, error, stackTrace) {
            debugPrint('Error loading asset image: $error');
            return _buildErrorPlaceholder();
          },
    );
  }

  Widget _buildFallbackImage() {
    if (fallbackImagePath != null && fallbackImagePath!.isNotEmpty) {
      try {
        return _buildAssetImage(fallbackImagePath!);
      } catch (e) {
        debugPrint('Error loading fallback image: $e');
        return _buildErrorPlaceholder();
      }
    }
    return SizedBox();
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Icon(
          Icons.broken_image,
          size: (width ?? 24) * 0.5,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}
