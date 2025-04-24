import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo_list_app/components/widget.dart';
import 'package:todo_list_app/extensions/colors.dart';
import 'package:todo_list_app/ui/intro/onboarding/welcome_screen.dart';
import 'package:todo_list_app/utils/constrants.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  PageController _pageController = PageController();
  int currentPage = 0;

  List<WalkThroughModelClass> walkThroughList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    walkThroughList.add(WalkThroughModelClass(
      title: 'Manage your tasks',
      subTitle:
          'You can easily manage all of your daily\ntasks in DoMe for free',
      image: img_walkThrough1,
    ));
    walkThroughList.add(WalkThroughModelClass(
      title: 'Create daily routine',
      subTitle:
          'In Uptodo  you can create your\npersonalized routine to stay productive',
      image: img_walkThrough2,
    ));
    walkThroughList.add(WalkThroughModelClass(
      title: 'Orgonaize your tasks',
      subTitle:
          'You can organize your daily tasks by\nadding your tasks into separate categories',
      image: img_walkThrough3,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Nút "SKIP"
            _buildSkipButton(),
            // PageView
            _buildOnbroading(),
            119.height,
            // Nút tiếp tục hoặc hoàn tất
            AppButton(
              text: currentPage == walkThroughList.length - 1
                  ? 'Get Started'
                  : 'Next',
              onTap: () {
                if (currentPage == walkThroughList.length - 1) {
                  setValue(IS_FIRST_TIME, false);
                } else {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        'SKIP',
        style: boldTextStyle(color: primaryTextColor.withValues(alpha: 0.44)),
      ).paddingOnly(top: 14, left: 24).onTap(() {
        setValue(IS_FIRST_TIME, false);
        WelcomeScreen().launch(context);
      }),
    );
  }

  Widget _buildOnbroading() {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          children: walkThroughList.map((e) {
            return Column(
              children: [
                Image.asset(e.image.validate(),
                    width: 271, height: 296, fit: BoxFit.contain),
                Vertical_medium,
                // Chỉ báo trang
                _buildOnbroadingPageControl(),
                Vertical_medium,
                _buildOnboardingTitleAndContent(
                    e.title.validate(), e.subTitle.validate()),
              ],
            ).paddingSymmetric(horizontal: 16);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildOnbroadingPageControl() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(walkThroughList.length, (index) {
        return Container(
          width: currentPage == index ? 26 : 22,
          height: currentPage == index ? 4 : 3,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: currentPage == index
                ? primaryTextColor.withValues(alpha: 0.87)
                : primaryTextColor.withValues(alpha: 0.44),
          ),
        );
      }),
    );
  }

  Widget _buildOnboardingTitleAndContent(String title, String subTitle) {
    return Column(
      children: [
        Text(
          title,
          style: boldTextStyle(size: 32, color: primaryTextColor),
          textAlign: TextAlign.center,
        ),
        42.height,
        Text(
          subTitle,
          style: secondaryTextStyle(size: 16, color: primaryTextColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
