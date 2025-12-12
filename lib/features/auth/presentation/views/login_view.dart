import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/core/DI/injection.dart';
import 'package:recipesapp/features/auth/cubits/login_cubit/login_cubit.dart';
import 'package:recipesapp/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),

      child: SafeArea(
        top: false,
        bottom: false,
        minimum: EdgeInsets.zero,
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: LoginViewBody(),
        ),
      ),
    );
  }
}
