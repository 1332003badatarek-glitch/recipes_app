import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/config/routing/app_route_names.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/features/auth/cubits/login_cubit/login_cubit.dart';
import 'package:recipesapp/features/auth/presentation/widgets/custome_password_field.dart';
import 'package:recipesapp/features/auth/presentation/widgets/custome_text_button.dart';
import 'package:recipesapp/features/auth/presentation/widgets/custome_text_field.dart';
import 'package:recipesapp/features/auth/presentation/widgets/elevated_button.dart';
import 'package:recipesapp/features/auth/presentation/widgets/login_and_signup_title.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  String? _email, _password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouteNames.homeView,
            (route) => false,
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error.statusCode == 400
                    ? 'incorrect Email or Password please try again'
                    : state.error.message,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              backgroundColor: AppColors.primaryColor,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                LoginAndSignUpTitle(title: 'Login'),
                CustomeTextFormField(
                  titleField: 'Email',
                  hintText: 'example@example.com',
                  textInputType: TextInputType.emailAddress,
                  validator: _emailValidator,
                  onsaved: (value) => _email = value,
                ),
                CustomePasswordFormField(
                  validator: _passwordValidator,
                  onSaved: (value) => _password = value,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 8 / 100,
                    bottom: MediaQuery.of(context).size.height * 4 / 100,
                  ),
                  child: CustomeElevatedButton(
                    onPressed: _onPressedLogin,
                    buttonText: 'Login',
                    buttonTextColor: AppColors.whiteTextColor,
                  ),
                ),
                CustomeElevatedButton(
                  onPressed: () {},
                  buttonText: 'Sign Up',
                  buttonTextColor: AppColors.whiteTextColor,
                ),

                CustomeTextButton(text: 'Forget Passowrd?', onPressed: () {}),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onPressedLogin() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      log('email: $_email , password: $_password');
      await BlocProvider.of<LoginCubit>(context).login(_email!, _password!);
      log('loged in');
    }
  }

  String? _passwordValidator(value) {
    if (value == null || value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }
}
