class LoginUsecase {
  Future<bool> loginUser(String pin) async {
    return pin == "123456";
  }
}
