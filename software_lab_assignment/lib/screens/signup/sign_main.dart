import 'package:flutter/material.dart';
import 'package:software_lab_assignment/screens/signup/signup_business_hours.dart';
import 'package:software_lab_assignment/screens/signup/signup_confirmation.dart';
import 'package:software_lab_assignment/screens/signup/signup_farm_info.dart';
import 'package:software_lab_assignment/screens/signup/signup_verification.dart';
import 'package:software_lab_assignment/screens/signup/signup_welcome.dart';
import 'package:software_lab_assignment/services/auth_service.dart';

class SignMain extends StatefulWidget {
  const SignMain({super.key});

  @override
  State<SignMain> createState() => _SignMainState();
}

class _SignMainState extends State<SignMain> {
  int _step = 0;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _informalNameController = TextEditingController();
  final TextEditingController _streetAddressController =
      TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();

  String imageName = "Default.png";

  final Map<String, List<String>> _selectedTimeSlots = {
    'mon': [],
    'tue': [],
    'wed': [],
    'thu': [],
    'fri': [],
    'sat': [],
    'sun': []
  };

  void _nextStep() {
    if (_step < 4) {
      setState(() {
        _step++;
      });
    }
  }

  void onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registration Successful')),
    );
    setState(() {
      _step = 4;
    });
  }

  void onFail() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please try again later')),
    );
  }

  void _previousStep() {
    if (_step > 0) {
      setState(() {
        _step--;
      });
    }
  }

  AuthService authService = AuthService();

  Future<void> handleRegister() async {
    await authService.register(
        _emailController.text,
        _passwordController.text,
        _nameController.text,
        _phoneController.text,
        "farmer",
        _businessNameController.text,
        _informalNameController.text,
        _streetAddressController.text,
        _cityController.text,
        _stateController.text,
        _zipcodeController.text,
        imageName,
        _selectedTimeSlots,
        onSuccess,
        onFail);
  }

  @override
  Widget build(BuildContext context) {
    return _step == 0
        ? SignupWelcome(
            emailController: _emailController,
            passwordController: _passwordController,
            nameController: _nameController,
            phoneController: _phoneController,
            confirmPasswordController: _confirmPasswordController,
            nextStep: _nextStep,
          )
        : _step == 1
            ? SignupFarmInfo(
                businessNameController: _businessNameController,
                informalNameController: _informalNameController,
                streetAddressController: _streetAddressController,
                cityController: _cityController,
                stateController: _stateController,
                zipcodeController: _zipcodeController,
                nextStep: _nextStep,
                previousStep: _previousStep,
              )
            : _step == 2
                ? SignupVerification(
                    imageName: imageName,
                    nextStep: _nextStep,
                    previousStep: _previousStep,
                  )
                : _step == 3
                    ? SignupBusinessHours(
                        selectedTimeSlots: _selectedTimeSlots,
                        handleRegister: handleRegister,
                        previousStep: _previousStep,
                      )
                    : SignupConfirmation();
  }
}
