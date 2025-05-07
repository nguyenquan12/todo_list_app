import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo_list_app/components/my_text_form_field.dart';
import 'package:todo_list_app/components/widget.dart';
import 'package:todo_list_app/extensions/colors.dart';
import 'package:todo_list_app/ui/home/home_page.dart';
import 'package:todo_list_app/ui/login_register/register/register_screen.dart';
import 'package:todo_list_app/utils/constrants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                _buildTextFormField(),
                _buildLoginOrLoginWithButton(),
                _buildRichText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 50),
      child: Text(
        'Login',
        style: boldTextStyle(
          size: 32,
          color: whiteColor.withValues(alpha: 0.87),
          fontFamily: 'Lato',
        ),
      ),
    );
  }

  Widget _buildTextFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText('Username'),
        _buildUsernameTextFormField(),
        MyText('Password'),
        _buildPasswordTextFormField(),
        70.height,
      ],
    );
  }

  Widget _buildUsernameTextFormField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 25),
      child: MyTextFormField(
        label: 'Enter your Username',
        textFieldType: TextFieldType.NAME,
      ),
    );
  }

  Widget _buildPasswordTextFormField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 25),
      child: MyTextFormField(
        label: '* * * * * * * * * *',
        textFieldType: TextFieldType.PASSWORD,
      ),
    );
  }

  Widget _buildLoginOrLoginWithButton() {
    return Column(
      children: [
        _buildLoginButton(),
        30.height,
        _buildDivider(),
        30.height,
        _buildLoginWithGoogleButton(),
        Vertical_small,
        _buildLoginWithAppleButton(),
      ],
    );
  }

  Widget _buildLoginButton() {
    return AppButton(
      width: context.width() - 48,
      text: 'Login',
      textStyle: secondaryTextStyle(color: white, size: 16, fontFamily: 'Lato'),
      color: primaryButtonColor,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        HomePage().launch(context);
      },
    );
  }

  Widget _buildDivider() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            indent: 0,
            endIndent: 2,
            color: grey,
          ),
        ),
        Text(
          'or',
          style: boldTextStyle(color: grey),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            indent: 2,
            endIndent: 0,
            color: grey,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginWithGoogleButton() {
    return AppButton(
      width: context.width() - 48,
      color: backgroundColor,
      shapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: primaryButtonColor,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img_logoGoogle,
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          ),
          10.width,
          Text(
            'Login with Google',
            style: secondaryTextStyle(
              size: 16,
              color: white.withValues(alpha: 0.87),
              fontFamily: 'Lato',
            ),
          )
        ],
      ),
      onTap: () {},
    );
  }

  Widget _buildLoginWithAppleButton() {
    return AppButton(
      width: context.width() - 48,
      color: backgroundColor,
      shapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: primaryButtonColor,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img_logoApple,
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          ),
          10.width,
          Text(
            'Login with Google',
            style: secondaryTextStyle(
              size: 16,
              color: white.withValues(alpha: 0.87),
              fontFamily: 'Lato',
            ),
          )
        ],
      ),
      onTap: () {},
    );
  }

  Widget _buildRichText() {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'Don’t have an account? ',
            style:
                secondaryTextStyle(size: 12, color: grey, fontFamily: 'Lato'),
          ),
          WidgetSpan(
            child: Text(
              'Register',
              style: boldTextStyle(size: 12, color: white, fontFamily: 'Lato'),
            ).onTap(() {
              RegisterScreen().launch(context);
            }),
          ),
        ]),
      ),
    ).center();
  }
}
