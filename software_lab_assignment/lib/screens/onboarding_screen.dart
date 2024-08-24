import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              buildPage(
                imagePath: 'assets/onboarding2.png',
                title: 'Quality',
                description:
                    'Sell your farm fresh products directly to consumers.',
              ),
              buildPage(
                imagePath: 'assets/onboarding2.png',
                title: 'Plan Your Trip',
                description:
                    'Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.',
              ),
              buildPage(
                imagePath: 'assets/onboarding3.png',
                title: 'Enjoy Your Journey',
                description:
                    'We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time. ',
              ),
            ],
          ),
          Positioned(
            bottom: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => buildDot(index, context)),
            ),
          ),
          Positioned(
            bottom: 50,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press, e.g., navigate to another screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Background color
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                'Join the movement!',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: TextButton(
              onPressed: () {
                // Navigate to Login Screen
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Image.asset(imagePath),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 10,
      width: _currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
