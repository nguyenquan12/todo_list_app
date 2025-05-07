import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo_list_app/components/my_text_form_field.dart';
import 'package:todo_list_app/extensions/colors.dart';

class CreateOrEditCategory extends StatefulWidget {
  const CreateOrEditCategory({super.key});

  @override
  State<CreateOrEditCategory> createState() => _CreateOrEditCategoryState();
}

class _CreateOrEditCategoryState extends State<CreateOrEditCategory> {
  final _nameCategoryTextController = TextEditingController();
  final List<Color> _colorDataSource = [];
  Color? colorSelected;

  @override
  void initState() {
    super.initState();

    _colorDataSource.addAll([
      Color(0xFFC9CC41),
      Color(0xFF66CC41),
      Color(0xFF41CCA7),
      Color(0xFF4181CC),
      Color(0xFF41A2CC),
      Color(0xFFCC8441),
      Color(0xFF9741CC),
      Color(0xFFCC4173),
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
      Colors.brown,
      Colors.grey,
      Colors.teal,
      Colors.cyan,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          "create_category_page_title".tr(),
          style: boldTextStyle(size: 20, color: white.withValues(alpha: 0.87)),
        ),
      ),
      body: _buildBodyPageScreen(context),
    );
  }

  Widget _buildBodyPageScreen(BuildContext context) {
    return Column(
      children: [
        _buildCategoryNameField(),
        _buildCategoryChooseIconField(context),
        _buildCategoryChooseBackgroundColorField(context),
        Spacer(),
        _buildOnboardingNCancelAndCreateButton()
      ],
    );
  }

  Widget _buildCategoryNameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle("create_category_form_category_name_label".tr()),
          16.height,
          MyTextFormField(
            label: "create_category_form_category_name_placeholder".tr(),
            textFieldType: TextFieldType.NAME,
            textEditingController: _nameCategoryTextController,
          )
        ],
      ),
    );
  }

  Widget _buildCategoryChooseIconField(BuildContext context) {
    return Container(
      width: context.width() - 48,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle("create_category_form_category_icon_label".tr()),
          16.height,
          AppButton(
            text: "create_category_form_category_icon_placeholder".tr(),
            textStyle: secondaryTextStyle(
              size: 12,
              color: white.withValues(alpha: 0.87),
            ),
            color: white.withValues(alpha: 0.21),
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChooseBackgroundColorField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle(
              "create_category_form_category_background_color_label".tr()),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 36,
            width: double.infinity,
            child: ListView.builder(
              itemCount: _colorDataSource.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final color = _colorDataSource[index];
                final isSelected = colorSelected == color;
                return GestureDetector(
                  onTap: () {
                    print("choose color in index: $index");
                    setState(() {
                      colorSelected = color;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(36 / 2),
                    ),
                    child: isSelected
                        ? Icon(
                            Icons.check,
                            color: white,
                            size: 22,
                          ).center()
                        : null,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFieldTitle(String titleLabel) {
    return Text(
      titleLabel,
      style: boldTextStyle(size: 16, color: white.withValues(alpha: 0.87)),
    );
  }

  Widget _buildOnboardingNCancelAndCreateButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Cancel
          AppButton(
            text: 'Cancel',
            color: Colors.transparent,
            textColor: primaryButtonColor,
            elevation: 0,
            onTap: () {},
          ),
          // Create Category
          AppButton(
            text: 'Create Category',
            textColor: white,
            color: primaryButtonColor,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
