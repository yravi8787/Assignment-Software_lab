import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class SignupVerification extends StatefulWidget {
  String imageName;
  final VoidCallback nextStep;
  final VoidCallback previousStep;

  SignupVerification(
      {super.key,
      required this.imageName,
      required this.nextStep,
      required this.previousStep});

  @override
  _SignupVerificationState createState() => _SignupVerificationState();
}

class _SignupVerificationState extends State<SignupVerification> {
  File? _selectedImage;

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        widget.imageName = pickedFile.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup 3 of 4')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Verification',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Attach proof of registration'),
            const SizedBox(height: 10),
            _selectedImage != null
                ? Image.file(
                    _selectedImage!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                : ElevatedButton.icon(
                    onPressed: _pickImage, // Trigger image picker
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Upload'),
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.nextStep();
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 18.0, horizontal: 40),
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                'Continue',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                widget.previousStep();
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
