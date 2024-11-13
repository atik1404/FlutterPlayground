
import 'package:MoviePlayground/assets/AppColors.dart';
import 'package:MoviePlayground/assets/AppDimensions.dart';
import 'package:MoviePlayground/assets/AppImagePath.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'assets/AppString.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.titleHomeScreen,
        showBackButton: false,
      ),
      body: Column(children: [
        Padding(
          padding: AppDimensions.kPadding10,
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 180.0,
                  autoPlay: true,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayCurve: Curves.easeInOutQuint,
                  onPageChanged: (index, _)=>{
                    setState(() {
                      _currentIndex = index;
                    })
                  }
                ),
                items: AppImagePath.sliderImage.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                          borderRadius: AppDimensions.kRadius10,
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                            width: 120,
                            height: 120,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                AppImagePath.imgPlaceHolder,
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: AppDimensions.margin10),
              DotsIndicator(
                dotsCount: AppImagePath.sliderImage.length,
                position: _currentIndex.toDouble(),
                decorator: DotsDecorator(
                  activeShape: RoundedRectangleBorder(borderRadius: AppDimensions.kRadius10),
                  spacing: AppDimensions.kPadding5,
                  activeColor: AppColors.mdBlue200,
                  size: const Size(8, 8),
                ),
              )
            ],
          )
        )
      ]),
    );
  }
}
