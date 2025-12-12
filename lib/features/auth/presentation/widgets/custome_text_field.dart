import 'package:flutter/material.dart';
import 'package:recipesapp/config/themes/app_colors.dart';

class CustomeTextFormField extends StatelessWidget {
  final String _titleField;
  final String _hintText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final void Function(String?)? onsaved;
  const CustomeTextFormField({
    super.key,
    required String titleField,
    required String hintText,
    required this.textInputType,
    required this.validator,
    required this.onsaved,
  }) : _titleField = titleField,
       _hintText = hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _titleField,
            style: Theme.of(
              context,
            ).textTheme.titleMedium,
          ),

          TextFormField(
            cursorColor: AppColors.primaryColor,
            keyboardType: textInputType,
            selectAllOnFocus: true,
            validator: validator,
            onSaved: onsaved,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.componentPink,
              hoverColor: AppColors.secondryColor,
              hintText: _hintText,
            ),
          ),
        ],
      ),
    );
  }
}
