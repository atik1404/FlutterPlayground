import 'package:bloc/bloc.dart';
import 'package:first_flutter/feature/login/bloc/form_validation_state.dart';

import 'form_validation_event.dart';

class LoginBloc extends Bloc<UiEvent, UiState> {
  LoginBloc() : super(UiState.initial()) {
    on<PhoneNumberChanged>(_onPhoneNumberChange);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmit>(_onFormSubmitted);
  }

  void _onPhoneNumberChange(PhoneNumberChanged event, Emitter<UiState> emit) {
    final isPhoneNumberValid = _isPhoneNumberValid(event.phoneNumber);

    emit(state.copyWith(
        phoneNumber: event.phoneNumber,
        isPhoneNumberValid: isPhoneNumberValid,
        isFormValid: state.isPasswordValid && isPhoneNumberValid));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<UiState> emit) {
    bool isPasswordValid = _isPasswordValid(event.password);

    emit(state.copyWith(
        password: event.password,
        isPasswordValid: isPasswordValid,
        isFormValid: state.isPhoneNumberValid && isPasswordValid));
  }

  void _onFormSubmitted(FormSubmit event, Emitter<UiState> emit) async {
    if (state.isFormValid) {
      emit(state.copyWith(isSubmitting: true));
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } else {
      emit(state.copyWith(isFailure: true));
    }
  }

  bool _isPhoneNumberValid(String phone) {
    return phone.length == 11;
  }

  bool _isPasswordValid(String password) {
    return password.length == 5;
  }
}
