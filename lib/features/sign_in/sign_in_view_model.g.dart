// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInViewModel on SignInViewModelBase, Store {
  late final _$isPasswordVisibleAtom =
      Atom(name: 'SignInViewModelBase.isPasswordVisible', context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$SignInViewModelBaseActionController =
      ActionController(name: 'SignInViewModelBase', context: context);

  @override
  void togglePasswordVisible() {
    final _$actionInfo = _$SignInViewModelBaseActionController.startAction(
        name: 'SignInViewModelBase.togglePasswordVisible');
    try {
      return super.togglePasswordVisible();
    } finally {
      _$SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordVisible: ${isPasswordVisible}
    ''';
  }
}
