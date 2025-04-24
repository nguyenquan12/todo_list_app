import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo_list_app/components/widget.dart';
import 'package:todo_list_app/extensions/colors.dart';
import 'package:todo_list_app/ui/intro/onboarding/walk_through_screen.dart';
import 'package:todo_list_app/utils/constrants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    try {
      setStatusBarColor(Colors.transparent);
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WalkThroughScreen()),
      );
    } catch (e) {
      print('Error in init: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: _buildBodyPage(),
      ),
    );
  }

  Widget _buildBodyPage() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildIconSplash(),
          _buildTextSplash(),
          Vertical_small,
          Loading(),
        ],
      ),
    );
  }

  Widget _buildIconSplash() {
    return Image.asset(
      ic_splash,
      width: 113,
      height: 113,
      fit: BoxFit.contain,
    );
  }

  Widget _buildTextSplash() {
    return Text(
      'UpTodo',
      style: boldTextStyle(color: scaffoldBackgroundColor, size: 40),
    );
  }
}
