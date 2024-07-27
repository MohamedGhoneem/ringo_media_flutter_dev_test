import 'dart:convert';
import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media_flutter_dev_test/core/common/models/success_model.dart';
import 'package:ringo_media_flutter_dev_test/features/main/ui/main_page.dart';

import '../../../../core/common/models/error/handler/error_model.dart';
import '../../../../core/design_system/app_colors.dart';
import '../../../../utilities/utilities.dart';
import '../../../../utilities/validations.dart';

class LoginBloc extends BaseBloc
    with RxdartBlocState<SuccessModel, ErrorModel>, Validations {
  BehaviorSubject<RequestState> requestStateSubject = BehaviorSubject.seeded(
    RequestState(status: RequestStatus.init, message: RequestStatus.init.name),
  );

  final BehaviorSubject<String> _emailSubject = BehaviorSubject();
  final BehaviorSubject<String> _passwordSubject = BehaviorSubject();
  final BehaviorSubject<bool> obscureSubject = BehaviorSubject.seeded(true);
  final BehaviorSubject<bool> _isValidateFormSubject =
      BehaviorSubject.seeded(false);

  Stream<String> get emailStream => _emailSubject.stream;

  Stream<String> get passwordStream => _passwordSubject.stream;

  Stream<bool> get obscureStream => obscureSubject.stream;

  Stream<bool> get isValidateFormStream => _isValidateFormSubject.stream;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Function(String) get onChangedEmailField {
    return _emailSubject.sink.add;
  }

  Function(String) get onChangedPasswordField {
    return _passwordSubject.sink.add;
  }

  Color get signInButtonBgColor {
    if (validateEmail(_emailSubject.valueOrNull) == null &&
        validatePassword(_passwordSubject.valueOrNull) == null) {
      _isValidateFormSubject.sink.add(true);
      return primaryColor;
    }
    _isValidateFormSubject.sink.add(false);

    return hintColor;
  }

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      requestStateSubject.sink.add(RequestState(
          status: RequestStatus.loading, message: RequestStatus.loading.name));
      Future.delayed(const Duration(seconds: 2), () {
        requestStateSubject.sink.add(RequestState(
            status: RequestStatus.success,
            message: RequestStatus.success.name));

        navigateAndPop(const MainPage());
      });
    }
  }

  @override
  void dispose() {
    _emailSubject.close();
    _passwordSubject.close();
    obscureSubject.close();
    _isValidateFormSubject.close();
  }
}
