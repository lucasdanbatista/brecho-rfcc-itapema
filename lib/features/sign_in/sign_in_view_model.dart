import 'package:mobx/mobx.dart';

part 'sign_in_view_model.g.dart';

class SignInViewModel = SignInViewModelBase with _$SignInViewModel;

abstract class SignInViewModelBase with Store {
  @observable
  bool isPasswordVisible = false;

  @action
  void togglePasswordVisible() => isPasswordVisible = !isPasswordVisible;
}
