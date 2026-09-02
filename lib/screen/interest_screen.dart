import 'package:flutter/material.dart';
import 'package:smarttrip/theme/app_colors.dart';
import 'package:smarttrip/utils/ui_helpers.dart';
import 'package:smarttrip/widgets/interest_card.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});
  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final List<Map<String, dynamic>> _interests = [
    {'id': 'sea', 'title': 'Biển', 'icon': Icons.water},
    {'id': 'food', 'title': 'Ẩm thực', 'icon': Icons.restaurant},
    {
      'id': 'history',
      'title': 'Di tích lịch sử',
      'icon': Icons.account_balance,
    },
    {'id': 'night', 'title': 'Giải trí ban đêm', 'icon': Icons.nightlife},
    {'id': 'mountain', 'title': 'Leo núi', 'icon': Icons.hiking},
    {'id': 'cafe', 'title': 'Cafe check-in', 'icon': Icons.local_cafe},
  ];
  final List<String> _selectedInterests = [];
  void _toggleInterest(String id) {
    setState(() {
      if (_selectedInterests.contains(id)) {
        _selectedInterests.remove(id);
      } else {
        _selectedInterests.add(id);
      }
    });
  }

  void _handleComplete() {
    if (_selectedInterests.isEmpty) {
      UiHelpers.showError(context, "Vui lòng chọn ít nhất một sở thích");
      return;
    }
    UiHelpers.showSuccess(context, 'Đã lưu sở thích thành công');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fafc),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: Color.fromARGB(15, 8, 130, 137),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_rounded,
                  color: AppColors.primary,
                  size: 36,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Sở thích của bạn là gì?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Chọn các danh mục bạn quan tâm để chúng tôi gợi ý những địa điểm phù hợp nhất',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 28),
              Column(
                children: _interests.map((item) {
                  final bool isSelected = _selectedInterests.contains(
                    item['id'],
                  );
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InterestCard(
                      title: item['title'] as String,
                      icon: item['icon'] as IconData,
                      isSelected: isSelected,
                      onTap: () => _toggleInterest(item['id'] as String),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: _handleComplete,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hoàn tất',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
