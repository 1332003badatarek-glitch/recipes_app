import 'package:flutter/material.dart';
import 'package:recipesapp/config/themes/app_colors.dart';

class CustomePasswordFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  const CustomePasswordFormField({
    super.key,
    required this.validator,
    required this.onSaved,
  });

  @override
  State<CustomePasswordFormField> createState() =>
      _CustomePasswordFormFieldState();
}

class _CustomePasswordFormFieldState extends State<CustomePasswordFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: Theme.of(
              context,
            ).textTheme.titleMedium,
          ),

          TextFormField(
            obscureText: _obscureText,
            cursorColor: AppColors.primaryColor,
            selectAllOnFocus: true,
            keyboardType: TextInputType.visiblePassword,
            validator: widget.validator,
            onSaved: widget.onSaved,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              filled: true,
              fillColor: AppColors.componentPink,
              hoverColor: AppColors.secondryColor,
              hintText: '123Ass@#',
            ),
          ),
        ],
      ),
    );
  }
}
