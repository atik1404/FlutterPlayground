

import 'package:flutter/cupertino.dart';

abstract class UiEvent{}

class PhoneNumberChanged extends UiEvent{
  final String phoneNumber;
  PhoneNumberChanged(this.phoneNumber);
}

class PasswordChanged extends UiEvent{
  final String password;
  PasswordChanged(this.password);
}

class FormSubmit extends UiEvent{}