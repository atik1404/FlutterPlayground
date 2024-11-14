import 'package:first_flutter/home_screen.dart';
import 'package:first_flutter/resources/AppColors.dart';
import 'package:first_flutter/resources/AppImagePath.dart';
import 'package:flutter/material.dart';

import 'resources/AppDimensions.dart';
import 'resources/AppString.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<PasswordField> {
  var _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: AppDimensions.kPadding10,
          child: Column(
            children: [
              Image.asset(AppImagePath.imgLoginLogo),
              const Text(
                AppStrings.headingWelcome,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: AppDimensions.extraLargeTextSize,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mdRed400),
              ),
              const Text(
                AppStrings.headingBack,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: AppDimensions.extraLargeTextSize,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
              const SizedBox(height: AppDimensions.margin10),
              const Text(
                AppStrings.msgSignIn,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: AppDimensions.smallTextSize,
                    fontWeight: FontWeight.normal,
                    color: AppColors.mdGrey400),
              ),
              const SizedBox(height: AppDimensions.margin10),
              Padding(
                padding: AppDimensions.kPaddingH15,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            AppStrings.headerMobileNumber,
                            style: TextStyle(
                                fontSize: AppDimensions.mediumTextSize,
                                color: AppColors.mdGrey500),
                          )),
                      TextField(
                        maxLines: 1,
                        maxLength: 11,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: AppStrings.hintMobileNumber,
                            counterText: "",
                            hintMaxLines: 1,
                            hintStyle: const TextStyle(
                                color: AppColors.mdGrey400,
                                fontSize: AppDimensions.regularTextSize),
                            filled: true,
                            fillColor: AppColors.white,
                            border: OutlineInputBorder(
                                borderRadius: AppDimensions.kRadius10,
                                borderSide: const BorderSide(
                                    width: 1.0, color: AppColors.mdGrey100))),
                      ),
                      const SizedBox(height: AppDimensions.margin15),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          AppStrings.headerPassword,
                          style: TextStyle(
                              fontSize: AppDimensions.mediumTextSize,
                              color: AppColors.mdGrey500),
                        ),
                      ),
                      TextField(
                        maxLines: 1,
                        maxLength: 20,
                        obscureText: _isVisible,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            hintText: AppStrings.hintPassword,
                            hintMaxLines: 1,
                            counterText: "",
                            hintStyle: const TextStyle(
                                color: AppColors.mdGrey400,
                                fontSize: AppDimensions.regularTextSize),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1.0, color: AppColors.mdGrey100)),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                icon: Icon(_isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                      ),
                      const SizedBox(height: 35),
                      SizedBox(
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
                              backgroundColor: AppColors.mdRed600),
                          child: const Text(
                            AppStrings.actionSignIn,
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: AppDimensions.regularTextSize),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.headingDontHaveAccount,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.smallTextSize,
                      color: AppColors.mdGrey500
                    ),
                  ),
                  SizedBox(width: AppDimensions.margin5),
                  Text(
                    AppStrings.actionCreateAnAccount,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppDimensions.smallTextSize,
                        color: AppColors.mdBlue800),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
