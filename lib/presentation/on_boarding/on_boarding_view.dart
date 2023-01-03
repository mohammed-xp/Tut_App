import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/constans_manager.dart';
import 'package:tut_app/presentation/resources/routes_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';
import 'package:tut_app/presentation/resources/value_manager.dart';

import '../resources/color_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderObject();
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<SliderObject> _getSliderObject() => [
        SliderObject(
          AppStrings.onBoardingTitle_1,
          AppStrings.onBoardingSubTitle_1,
          ImageAssets.onBoardingImage_1,
        ),
        SliderObject(
          AppStrings.onBoardingTitle_2,
          AppStrings.onBoardingSubTitle_2,
          ImageAssets.onBoardingImage_2,
        ),
        SliderObject(
          AppStrings.onBoardingTitle_3,
          AppStrings.onBoardingSubTitle_3,
          ImageAssets.onBoardingImage_3,
        ),
        SliderObject(
          AppStrings.onBoardingTitle_4,
          AppStrings.onBoardingSubTitle_4,
          ImageAssets.onBoardingImage_4,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(_list[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: () {
                // go to previous slide
                _pageController.animateToPage(
                  _getPreviousIndex(),
                  duration: const Duration(
                      milliseconds: AppConstans.sliderAnimationTime,
                  ),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),

          Row(
            children: [
              for (int i = 0 ; i < _list.length ; i++)
                Padding(padding: EdgeInsets.all(AppPadding.p14),
                child: _getProperCircle(i),)
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
              onTap: () {
                // go to next slide
                _pageController.animateToPage(
                  _getNextIndex(),
                  duration: const Duration(
                    milliseconds: AppConstans.sliderAnimationTime,
                  ),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  int _getPreviousIndex() {
    int previousIndex = --_currentIndex;
    if(previousIndex == -1) {
      previousIndex = _list.length - 1;
    }

    return previousIndex;
  }

  int _getNextIndex() {
    int nextIndex = ++_currentIndex;
    if(nextIndex == _list.length) {
      nextIndex = 0;
    }

    return nextIndex;
  }

  Widget _getProperCircle(int index) {
    if (index == _currentIndex)
      return SvgPicture.asset(ImageAssets.hollowCirlceIc);
    else
      return SvgPicture.asset(ImageAssets.solidCircleIc);
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
