import "package:bloc/bloc.dart";

import "../usercase/login_usecase.dart";

part "login_state.dart";

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.luc) : super(LoginInitial());

  late LoginUsecase luc;

  Future<bool> loginUser(String pin) async {
    var isValidUser = luc.loginUser(pin);
    return isValidUser;
  }
}
