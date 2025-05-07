import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo_list_app/components/widget.dart';
import 'package:todo_list_app/extensions/colors.dart';
import 'package:todo_list_app/ui/login_register/login/login_screen.dart';
import 'package:todo_list_app/ui/login_register/register/register_screen.dart';

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
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.vertical,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Replace Spacer
              children: [
                _buildTitleAndDesc(),
                Column(
                  children: [
                    _buildButtonChangeLanguage(context),
                    _buildLoginButton(),
                    _buildCreateAccountButton(),
                    16.height,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndDesc() {
    return Column(
      children: [
        Vertical_large,
        Text(
          "welcome_title".tr(),
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
            "welcome_desc".tr(),
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

  Widget _buildButtonChangeLanguage(BuildContext context) {
    return AppButton(
      width: context.width() - 48,
      text: 'Change Language',
      textStyle: boldTextStyle(size: 16, color: whiteColor),
      color: primaryButtonColor,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        // Lấy ra locale hiện tại
        final currentLocale = context.locale.toString();
        if (currentLocale == 'en') {
          // Nếu locale hiện tại là tiếng Anh, chuyển sang tiếng Việt
          context.setLocale(Locale('vi'));
        } else {
          // Ngược lại, chuyển sang tiếng Anh
          context.setLocale(Locale('en'));
        }
      },
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 28),
      child: AppButton(
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
      ),
    );
  }

  Widget _buildCreateAccountButton() {
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
        onTap: () {
          RegisterScreen().launch(context);
        },
      ),
    );
  }
}
