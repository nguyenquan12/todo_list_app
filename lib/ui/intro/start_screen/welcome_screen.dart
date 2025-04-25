import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo_list_app/components/widget.dart';
import 'package:todo_list_app/extensions/colors.dart';
import 'package:todo_list_app/ui/login_register/login/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // Back arrow button
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackArrowButton(context),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildWelcomeTextAndContent(),
            Spacer(),
            _buildWelcomeLoginButton(),
            _buildWelcomeCreateAccountButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeTextAndContent() {
    return Column(
      children: [
        Vertical_large,
        Text(
          'Welcome UpTodo',
          style: boldTextStyle(
            size: 32,
            color: whiteColor.withValues(alpha: 0.87),
            fontFamily: 'Lato',
          ),
          textAlign: TextAlign.center,
        ),
        26.height,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: Text(
            'Please login to your account or create new account to continue',
            style: boldTextStyle(
              size: 16,
              color: whiteColor.withValues(alpha: 0.67),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeLoginButton() {
    return AppButton(
      width: context.width() - 48,
      text: 'LOGIN',
      textStyle: boldTextStyle(size: 16, color: whiteColor),
      color: primaryButtonColor,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        LoginScreen().launch(context);
      },
    );
  }

  Widget _buildWelcomeCreateAccountButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 67),
      child: AppButton(
        width: context.width() - 48,
        text: 'CREATE ACCOUNT',
        textStyle: boldTextStyle(color: whiteColor, size: 16),
        color: backgroundColor,
        shapeBorder: RoundedRectangleBorder(
          side: BorderSide(
            color: primaryButtonColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        onTap: () {},
      ),
    );
  }
}
