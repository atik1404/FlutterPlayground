import 'package:flutter/material.dart';


import '../home/home_screen.dart';
import '../../resources/AppColors.dart';
import '../../resources/AppDimensions.dart';
import '../../resources/AppImagePath.dart';
import '../../resources/AppString.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;//screen height
    var imageHeight = screenHeight * .3;//image height is 30% of the screen height

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        padding: AppDimensions.kPadding10,
        child: Column(
          children: [
            Image.asset(
              height: imageHeight,
                AppImagePath.imgLoginLogo
            ),
            const _HeadingText(
              text: AppStrings.headingWelcome,
              color: AppColors.mdRed400,
            ),
            const _HeadingText(
              text: AppStrings.headingBack,
              color: AppColors.black,
            ),
            const SizedBox(height: AppDimensions.margin10),
            const _MessageText(text: AppStrings.msgSignIn),
            const SizedBox(height: AppDimensions.margin10),
            _buildInputFields(),
            const SizedBox(height: AppDimensions.margin30),
            _buildSignInButton(context),

            const Spacer(),

            const _FooterText(),
          ],
        ),
      ),
    );
  }

  // Input fields for mobile number and password
  Widget _buildInputFields() {
    return Padding(
      padding: AppDimensions.kPaddingH15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _LabelText(text: AppStrings.headerMobileNumber),
          _buildTextField(
            hintText: AppStrings.hintMobileNumber,
            maxLength: 11,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: AppDimensions.margin15),
          const _LabelText(text: AppStrings.headerPassword),
          _buildTextField(
            hintText: AppStrings.hintPassword,
            maxLength: 20,
            obscureText: _isVisible,
            suffixIcon: IconButton(
              icon: Icon(_isVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // Reusable TextField widget
  Widget _buildTextField({
    required String hintText,
    required int maxLength,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
  }) {
    return TextField(
      maxLines: 1,
      maxLength: maxLength,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: obscureText ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: "",
        hintStyle: const TextStyle(
          color: AppColors.mdGrey400,
          fontSize: AppDimensions.regularTextSize,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: AppDimensions.kRadius10,
          borderSide: const BorderSide(
            width: 1.0,
            color: AppColors.mdGrey100,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }

  // Sign-in button widget
  Widget _buildSignInButton(BuildContext context) {
    return Padding(
        padding: AppDimensions.kPaddingH15,
        child: SizedBox(
          width: double.infinity,
          height: AppDimensions.kSizeH45.height,
          child: FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.mdRed600,
            ),
            child: const Text(
              AppStrings.actionSignIn,
              style: TextStyle(
                color: AppColors.white,
                fontSize: AppDimensions.regularTextSize,
              ),
            ),
          ),
        ));
  }
}

// Reusable text widget for headings
class _HeadingText extends StatelessWidget {
  final String text;
  final Color color;

  const _HeadingText({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: AppDimensions.extraLargeTextSize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

// Reusable text widget for labels
class _LabelText extends StatelessWidget {
  final String text;

  const _LabelText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: AppDimensions.mediumTextSize,
          color: AppColors.mdGrey500,
        ),
      ),
    );
  }
}

// Reusable text widget for messages
class _MessageText extends StatelessWidget {
  final String text;

  const _MessageText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: AppDimensions.smallTextSize,
        color: AppColors.mdGrey400,
      ),
    );
  }
}

// Footer text with navigation prompt
class _FooterText extends StatelessWidget {
  const _FooterText();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          AppStrings.headingDontHaveAccount,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppDimensions.smallTextSize,
            color: AppColors.mdGrey500,
          ),
        ),
        const SizedBox(width: AppDimensions.margin5),
        GestureDetector(
          onTap: () {
            // Navigate to account creation page
          },
          child: const Text(
            AppStrings.actionCreateAnAccount,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppDimensions.smallTextSize,
              color: AppColors.mdBlue800,
            ),
          ),
        ),
      ],
    );
  }
}
