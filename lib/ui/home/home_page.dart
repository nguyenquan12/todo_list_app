import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo_list_app/extensions/colors.dart';
import 'package:todo_list_app/ui/category/create_or_edit_category.dart';
import 'package:todo_list_app/utils/constrants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _pages = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _pages = [
      Container(
        color: blueColor,
      ),
      Container(
        color: redColor,
      ),
      Container(),
      Container(
        color: purple,
      ),
      Container(
        color: yellow,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24, top: 13),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                color: white.withValues(alpha: 0.87),
                Icons.sort,
                size: 24,
              )),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 13),
          child: Text(
            'Index',
            style: secondaryTextStyle(
                size: 20,
                color: white.withValues(alpha: 0.87),
                fontFamily: 'Lato'),
          ).center(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24, top: 13),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                img_avatar,
                width: 42,
                height: 42,
                fit: BoxFit.cover,
              ),
            ).onTap(() {}),
          ),
        ],
      ),
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CreateOrEditCategory().launch(context);
        },
        backgroundColor: primaryButtonColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: white.withValues(alpha: 0.98),
        unselectedItemColor: white.withValues(alpha: 0.50),
        backgroundColor: backgroundBottomNavigatorColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 2) {
            return;
          }
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              ic_home,
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: white.withValues(alpha: 0.50), // Màu sắc khi không chọn
            ),
            activeIcon: Image.asset(
              ic_home,
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: white.withValues(alpha: 0.98), // Màu sắc khi chọn
            ),
            label: 'Index',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ic_calendar,
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: white.withValues(alpha: 0.50),
            ),
            activeIcon: Image.asset(
              ic_calendar,
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: white.withValues(alpha: 0.98),
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
          BottomNavigationBarItem(
            icon: Image.asset(
              ic_clock,
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: white.withValues(alpha: 0.50),
            ),
            activeIcon: Image.asset(
              ic_clock,
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: white.withValues(alpha: 0.98),
            ),
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ic_user,
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: white.withValues(alpha: 0.50),
            ),
            activeIcon: Image.asset(
              ic_user,
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: white.withValues(alpha: 0.98),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
