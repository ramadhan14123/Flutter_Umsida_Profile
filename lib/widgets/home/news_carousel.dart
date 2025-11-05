import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umsida_profile/theme/app_colors.dart';

/// A simple horizontal news card carousel matching the provided design.
class NewsCarousel extends StatefulWidget {
  const NewsCarousel({super.key});

  @override
  State<NewsCarousel> createState() => _NewsCarouselState();
}

class _NewsCarouselState extends State<NewsCarousel> {
  final List<Map<String, String>> _items = [
    {
      'image': 'assets/images/banner-1.jpg',
      'title': 'Action, Abdimas Gagasan Mahasiswa FPIP Umsida yang Peduli Pendidikan Anak Desa',
    },
    {
      'image': 'assets/images/berita-2.jpeg',
      'title': 'IMM Averroes Umsida Gelar Diskusi Inspiratif dalam SABAR Vol 5',
    },
    {
      'image': 'assets/images/berita-1.jpeg',
      'title': 'Kegiatan Riset Mahasiswa: Dampak Program X terhadap Komunitas Lokal',
    },
  ];

  // images are built inline inside the item builder (so we can pass
  // width/height). The previous helper was removed to avoid an unused
  // declaration warning.

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Berita Terkini',
              style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 12),

          CarouselSlider.builder(
            itemCount: _items.length,
            itemBuilder: (context, index, realIdx) {
              final item = _items[index];
              // fixed image height (will be cropped if aspect ratio mismatch)
              const imageHeight = 140.0;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primaryBlue, width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // image area: fixed height, full width of the card
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Builder(builder: (ctx) {
                          final src = item['image']!;
                          final isNetwork = src.startsWith('http://') || src.startsWith('https://');
                          if (isNetwork) {
                            return Image.network(
                              src,
                              width: double.infinity,
                              height: imageHeight,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                width: double.infinity,
                                height: imageHeight,
                                color: AppColors.surfaceBlue,
                                child: const Center(child: Icon(Icons.broken_image, size: 36, color: Colors.grey)),
                              ),
                            );
                          }

                          return Image.asset(
                            src,
                            width: double.infinity,
                            height: imageHeight,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: double.infinity,
                              height: imageHeight,
                              color: Colors.grey[200],
                              child: const Center(child: Icon(Icons.image_not_supported, size: 36, color: Colors.grey)),
                            ),
                          );
                        }),
                      ),

                      // content area
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item['title']!,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontSize: 14,
                                  height: 1.3,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              const SizedBox(height: 8),

                              Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: 100,
                                  height: 36,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryBlueBorder,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    ),
                                    child: Text('Lihat', style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.surfaceBlue)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 280,
              viewportFraction: 0.56,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              autoPlay: false,
              padEnds: false,
            ),
          ),
        ],
      ),
    );
  }
}
