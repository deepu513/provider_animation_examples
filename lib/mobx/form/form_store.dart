import 'package:mobx/mobx.dart';

import 'form_error_state.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  final error = FormErrorState();
  List<ReactionDisposer> _disposers;

  @action
  setUserName(String value) {
    name = value;
  }

  @action
  setEmail(String value) {
    email = value;
  }

  @action
  setPassword(String value) {
    password = value;
  }

  @action
  validateUsername(String value) {
    if (_isNull(value) || value.isEmpty) {
      error.username = 'Cannot be blank';
      return;
    }
    error.username = null;
  }

  @action
  void validatePassword(String value) {
    error.password = _isNull(value) || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = _isEmail(value) ? null : 'Not a valid email';
  }

  _isEmail(String value) {
    return value.length > 4;
  }

  _isNull(Object value) {
    return value == null;
  }

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateUsername),
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

  void validateAll() {
    validatePassword(password);
    validateEmail(email);
    validateUsername(name);
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
