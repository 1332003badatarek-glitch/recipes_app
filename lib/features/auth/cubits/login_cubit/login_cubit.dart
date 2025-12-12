import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/core/errors/api_errors/api_error_model.dart';
import 'package:recipesapp/features/auth/data/models/login_response_model.dart';
import 'package:recipesapp/features/auth/data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(AuthRepo loginRepo)
    : _loginRepo = loginRepo,
      super(LoginInitial());
  final AuthRepo _loginRepo;

  Future<void> login(String userName, String password) async {
    emit(LoginLoading());
    final result = await _loginRepo.login(userName, password);
    result.fold(
      (error) {
        print('error hahahahahaha');
        log('error : ${error.message}');
        log('ststus code : ${error.statusCode}');
        emit(LoginFailure(error: error));
      },
      (userData) {
        print('%%%%%%%%%%%######@@@@@${userData.accessToken}');
        emit(LoginSuccess(userData: userData));
      },
    );
  }
}
