import 'package:flutter/material.dart';
import 'package:smarttrip/models/onboarding_item.dart';
import 'package:smarttrip/theme/app_colors.dart';
import 'package:smarttrip/theme/app_styles.dart';

class OnboardingCard extends StatelessWidget {
  final OnboardingItem item;
  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;
  const OnboardingCard({
    super.key,
    required this.item,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = currentPage == totalPages - 1;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
          bottom: 36,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                totalPages,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  height: 6,
                  width: currentPage == index ? 28 : 6,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? AppColors.primary
                        : const Color(0xffe5e7eb),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            //tiêu đề
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: AppTextStyles.titleheadline,
            ),
            const SizedBox(height: 12),
            Text(
              item.subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.titlebody,
            ),
            const SizedBox(height: 28),
            // Nút
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 8,
                  shadowColor: AppColors.primary.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: onNext,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isLastPage ? 'Bắt đầu ngay' : 'Tiếp tục',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 23,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
