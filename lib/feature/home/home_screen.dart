import 'package:first_flutter/feature/home/bloc/homebloc/home_bloc.dart';
import 'package:first_flutter/feature/home/bloc/homebloc/home_ui_event.dart';
import 'package:first_flutter/feature/home/bloc/homebloc/home_ui_state.dart';
import 'package:first_flutter/model/category.dart';
import 'package:first_flutter/model/movies.dart';
import 'package:first_flutter/resources/AppColors.dart';
import 'package:first_flutter/resources/AppDimensions.dart';
import 'package:first_flutter/resources/AppImagePath.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_bar.dart';
import '../../resources/AppString.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: AppStrings.titleHomeScreen,
        showBackButton: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _movieCarousel(AppImagePath.sliderImage),

          const SizedBox(height: AppDimensions.margin10),

          Padding(
              padding: AppDimensions.kPaddingH5,
              child: _movieCategoryList(getCategoryList())
          ),
          const SizedBox(height: AppDimensions.margin10),
          BlocBuilder<HomeBloc, HomeUiState>(builder: (context, state) {
            if(state.isLoading){
              return  const Center(child: CircularProgressIndicator());
            }
            return Expanded(
              child: _movieGrid(state.movies),
            );
          })
        ],
      )
    );
  }

  Widget _movieCarousel(List<String> slideImages) {
    return BlocBuilder<HomeBloc, HomeUiState>(
      builder: (context, state) {
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
                        context.read<HomeBloc>().add(SetCarouselPosition(index))
                      }),
                  items: slideImages.map((image) {
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
                  dotsCount: slideImages.length,
                  position: state.currentCarouselItemPosition.toDouble(),
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
      },
    );
  }

  Widget _movieCategoryList(List<Category> categories) {
    return SizedBox(
      height: 30,
      child: BlocBuilder<HomeBloc, HomeUiState>(
        builder: (context, state){
          return ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              var category = categories[index];
              bool isItemSelected = index == state.selectedCategory;
              return GestureDetector(
                onTap: () {
                  context.read<HomeBloc>().add(SelectCategory(index));
                  context.read<HomeBloc>().add(FetchMovies());
                },
                child: _movieCategoryItem(
                    category: category, isItemSelected: isItemSelected),
              );
            },
          );
        },
      ),
    );
  }

  Widget _movieCategoryItem({required Category category, required bool isItemSelected}) {
    return Container(
        margin: AppDimensions.kPaddingH5,
        decoration: BoxDecoration(
            color: isItemSelected ? AppColors.mdRed400 : AppColors.white,
            border:
                Border.all(color: AppColors.mdRed100, width: AppDimensions.one),
            borderRadius:
                const BorderRadius.all(Radius.circular(AppDimensions.five))),
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
        ));
  }

  Widget _movieGrid(List<MoviesEntity> movies){
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
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return _movieCard(
          movieName: movie.movieName,
          movieId: movie.movieId,
          rating: movie.movieRating,
          posterImage: movie.posterImage,
        );
      },
    );
  }

  Widget _movieCard({required String movieName, required String movieId, required rating, required String posterImage}) {
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
                      rating,
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

