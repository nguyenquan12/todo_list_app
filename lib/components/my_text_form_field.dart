import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatefulWidget {
  String label;
  double? width;
  TextFieldType textFieldType;
  TextInputAction? textInputAction;
  TextEditingController? textEditingController;
  FocusNode? focusNode;
  FocusNode? nextFocusNode;
  bool? autoFocus;
  TextInputType? keyboardType; // Loại bàn phím
  bool? labelSpace;

  MyTextFormField({
    required this.label,
    this.width,
    required this.textFieldType,
    this.textInputAction,
    this.textEditingController,
    this.focusNode,
    this.nextFocusNode,
    this.autoFocus,
    this.keyboardType,
    this.labelSpace,
  });

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  String checkText = ''; // Biến để kiểm tra nội dung nhập liệu

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // checkText != ''
        //     ? Text(
        //         widget.label,
        //         style: boldTextStyle(color: whiteColor, size: 14),
        //       )
        //     : widget.labelSpace.validate()
        //         ? Text(
        //             '',
        //             style: boldTextStyle(size: 14),
        //           )
        //         : Offstage(),
        // widget.labelSpace.validate() ? 6.height : Offstage(),
        Container(
          width: widget.width ?? context.width() - 48,
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: grey),
            borderRadius: BorderRadius.circular(6),
          ),
          child: AppTextField(
            keyboardType: widget.keyboardType ?? TextInputType.name,
            // Tự động focus khi mở màn hình.
            autoFocus: widget.autoFocus ?? false,
            // Điều khiển nội dung nhập liệu
            controller: widget.textEditingController,
            // Điều hướng focus khi nhập xong
            focus: widget.focusNode,
            nextFocus: widget.nextFocusNode,
            // Kiểu nhập liệu (email, password,...)
            textFieldType: widget.textFieldType,
            // Xác định hành động của phím "Enter" trên bàn phím ảo.
            textInputAction: widget.textInputAction ?? TextInputAction.next,
            textStyle: secondaryTextStyle(
                color: Color(0xFFAFAFAF), size: 16, fontFamily: 'Lato'),
            onChanged: (value) {
              checkText = value; // Cập nhật biến kiểm tra khi có thay đổi
              setState(() {});
            },
            // Ẩn biểu tượng mắt khi nhập mật khẩu
            suffixPasswordInvisibleWidget:
                Icon(Icons.visibility_off, color: Colors.grey),
            suffixPasswordVisibleWidget: Icon(Icons.visibility, color: white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.label,
              hintStyle: secondaryTextStyle(
                  color: Color(0xFFAFAFAF), size: 16, fontFamily: 'Lato'),
            ),
          ),
        )
      ],
    );
  }
}
