import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo_list_app/components/widget.dart';
import 'package:todo_list_app/extensions/colors.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              40.height,
              _buildLoginScreenTitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginScreenTitle() {
    return Text(
      'Login',
      style: boldTextStyle(size: 32, color: whiteColor.withValues(alpha: 0.87)),
    );
  }
}
