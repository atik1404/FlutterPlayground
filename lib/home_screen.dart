import 'package:first_flutter/model/category.dart';
import 'package:first_flutter/model/movies.dart';
import 'package:first_flutter/resources/AppColors.dart';
import 'package:first_flutter/resources/AppDimensions.dart';
import 'package:first_flutter/resources/AppImagePath.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'resources/AppString.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.titleHomeScreen,
        showBackButton: false,
      ),
      body: MovieUi(),
    );
  }
}

class MovieUi extends StatelessWidget{
  const MovieUi({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieCarouselState(),

            SizedBox(height: AppDimensions.margin10),

            Padding(
              padding: AppDimensions.kPaddingH5,
                child: MovieCategoryState()
            ),

            SizedBox(height: AppDimensions.margin10),

            SizedBox(
              child: MovieGrid(),
            )
          ],
      ),
    );
  }
}

class MovieCarouselState extends StatefulWidget {
  const MovieCarouselState({super.key});

  @override
  State<MovieCarouselState> createState() => _MovieCarousel();
}

class _MovieCarousel extends State<MovieCarouselState> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  onPageChanged: (index, _) => {
                        setState(() {
                          _currentIndex = index;
                        })
                      }),
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
                activeShape: RoundedRectangleBorder(
                    borderRadius: AppDimensions.kRadius10),
                spacing: AppDimensions.kPadding5,
                activeColor: AppColors.mdRed600,
                size: const Size(8, 8),
              ),
            ),
          ],
        ));
  }
}

class MovieCategoryState extends StatefulWidget {
  const MovieCategoryState({super.key});

  @override
  State<StatefulWidget> createState() => _MovieCategory();
}

class _MovieCategory extends State<MovieCategoryState> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getCategoryList().length,
        itemBuilder: (BuildContext context, int index) {
          var category = getCategoryList()[index];
          bool isItemSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                debugPrint("item clicked: $isItemSelected $selectedIndex}");
              });
            },
            child: Container(
                margin: AppDimensions.kPaddingH5,
                decoration: BoxDecoration(
                    color:
                        isItemSelected ? AppColors.mdRed400 : AppColors.white,
                    border: Border.all(
                        color: AppColors.mdRed100, width: AppDimensions.one),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(AppDimensions.five))),
                child: Padding(
                  padding: AppDimensions.kPaddingH20,
                  child: Center(
                    child: Text(
                      category.categoryName,
                      style: const TextStyle(
                        fontSize: AppDimensions.regularTextSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}

class MovieGrid extends StatelessWidget{
  const MovieGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: AppDimensions.kPadding10,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.7,
      ),
      itemCount: getMovies().length,
      itemBuilder: (context, index) {
        final movie = getMovies()[index];
        return MovieCard(
          movieName: movie.movieName,
          movieId: movie.movieId,
          movieRating: movie.movieRating,
          posterImage: movie.posterImage,
        );
      },
    );
  }
}

class MovieCard extends StatelessWidget {
  final String movieName;
  final String movieId;
  final String movieRating;
  final String posterImage;

  const MovieCard(
      {super.key,
      required this.movieName,
      required this.movieId,
      required this.movieRating,
      required this.posterImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.network(
                posterImage,
                fit: BoxFit.cover,
              ),
            ),
            // Rating Badge
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      movieRating,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Movie Title
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: Text(
                movieName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 5,
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
