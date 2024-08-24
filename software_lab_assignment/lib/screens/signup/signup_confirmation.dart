import 'package:flutter/material.dart';
import 'package:software_lab_assignment/screens/login_screen.dart';

class SignupConfirmation extends StatelessWidget {
  const SignupConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline,
                  color: Colors.green, size: 100),
              const SizedBox(height: 20),
              Text('You\'re all done!',
                  style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 20),
              const Text(
                  'Thank you for signing up. We\'ll review your details and get back to you.'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: const Text('Got it!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
