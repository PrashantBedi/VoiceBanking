enum ActionEnum {
  userInfo,
  balance,
  history,
  registerUser,
  removeUser,
  transferMoney,
  unknown,
}

class Action {
  ActionEnum getActionEnum(String action) {
    switch (action) {
      case "user_information":
        return ActionEnum.userInfo;
      case "ask_account_balance":
        return ActionEnum.balance;
      case "transaction_history":
        return ActionEnum.history;
      case "register_user":
        return ActionEnum.registerUser;
      case "remove_user":
        return ActionEnum.removeUser;
      case "transfer_money":
        return ActionEnum.transferMoney;
      default:
        return ActionEnum.unknown;
    }
  }
}

final AuthActionEnum = [
  ActionEnum.balance,
  ActionEnum.transferMoney,
];
