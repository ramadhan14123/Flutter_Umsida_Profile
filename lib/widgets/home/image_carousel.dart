import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:umsida_profile/theme/app_colors.dart';

/// Reusable image carousel widget.
///
/// Usage:
/// ImageCarousel(
///   items: ['assets/images/a.png', 'assets/images/b.png'],
///   isNetwork: false,
///   height: 200,
///   showIndicator: true,
/// )
class ImageCarousel extends StatefulWidget {
  final List<String> items;
  final bool isNetwork; // if true, load via network; otherwise load from assets
  final double? height;
  final bool autoPlay;
  final bool showIndicator;

  const ImageCarousel({
    super.key,
    required this.items,
    this.isNetwork = false,
    this.height,
    this.autoPlay = true,
    this.showIndicator = true,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final double height = widget.height ?? 200.0;

    if (widget.items.isEmpty) {
      return SizedBox(
        height: height,
        child: const Center(child: Text('No items')),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index, realIdx) {
            final src = widget.items[index];
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Builder(builder: (context) {
                    // auto-detect network source if the string looks like an http(s) URL
                    final uri = Uri.tryParse(src);
                    final isHttp = uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
                    if (widget.isNetwork || isHttp) {
                      return Image.network(
                        src,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[200],
                          child: const Center(child: Icon(Icons.broken_image, size: 36, color: Colors.grey)),
                        ),
                      );
                    }

                    // fallback to asset image with safe errorBuilder
                    return Image.asset(
                      src,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[200],
                        child: const Center(child: Icon(Icons.image_not_supported, size: 36, color: Colors.grey)),
                      ),
                    );
                  })),
            );
          },
          options: CarouselOptions(
            height: height,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            autoPlay: widget.autoPlay,
            onPageChanged: (index, reason) => setState(() => _current = index),
          ),
        ),

        if (widget.showIndicator)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.items.asMap().entries.map((entry) {
                final idx = entry.key;
                return GestureDetector(
                  onTap: () => setState(() => _current = idx),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == idx ? AppColors.indicatorActive : AppColors.indicatorInactive,
                    ),
                  ),
                );  
              }).toList(),
            ),
          ),
      ],
    );
  }
}
