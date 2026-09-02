import 'package:flutter/material.dart';
import 'package:smarttrip/models/onboarding_item.dart';
import 'package:smarttrip/screen/Login_screen.dart';
import 'package:smarttrip/widgets/onboarding_card.dart';
import 'package:smarttrip/widgets/onboarding_header.dart';

class Khampha extends StatefulWidget {
  const Khampha({super.key});

  @override
  State<Khampha> createState() => _KhamphaState();
}

class _KhamphaState extends State<Khampha> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPage() {
    if (_currentPage < OnboardingItem.items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  void _onSkip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: OnboardingItem.items.length,
            itemBuilder: (context, index) {
              final item = OnboardingItem.items[index];
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  // Positioned.fill(
                  //   child: Image.asset(
                  //     'assets/images/Gradient Overlay to ensure text legibility at the bottom.png',
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                ],
              );
            },
          ),
          OnboardingHeader(onSkip: _onSkip),
          OnboardingCard(
            item: OnboardingItem.items[_currentPage],
            currentPage: _currentPage,
            totalPages: OnboardingItem.items.length,
            onNext: _onNextPage,
          ),
        ],
      ),
    );
  }
}
