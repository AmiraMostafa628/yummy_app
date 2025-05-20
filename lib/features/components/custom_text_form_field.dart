import 'package:flutter/material.dart';
import 'package:yummy_app/core/resources/color_manager.dart';

class CustomDateAndTimeTextFormField extends StatelessWidget {
  const CustomDateAndTimeTextFormField({
    super.key,
    required this.text,
    required this.textEditingController,
    this.validate,
    this.onTap,
  });
  final String text;
  final TextEditingController textEditingController;
  final FormFieldValidator? validate;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: TextFormField(
        controller: textEditingController,
        readOnly: true,
        onTap: onTap,
        validator:validate,
        style: TextStyle(
            color: ColorManager.burgundyColor
        ),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18.0,
              horizontal: 14.0,
            ),
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.red,
                )),
            hintText: text,
            hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: ColorManager.burgundyColor,
            ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ));
  }
}

