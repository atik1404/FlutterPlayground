class UiState {
  final String phoneNumber;
  final String password;
  final bool isPhoneNumberValid;
  final bool isPasswordValid;
  final bool isFormValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  UiState({
    required this.phoneNumber,
    required this.password,
    required this.isPhoneNumberValid,
    required this.isPasswordValid,
    required this.isFormValid,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
  });

  factory UiState.initial() {
    return UiState(
        phoneNumber: "",
        password: "",
        isPhoneNumberValid: true,
        isPasswordValid: true,
        isFormValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false);
  }

  UiState copyWith({
    String? phoneNumber,
    String? password,
    bool? isPhoneNumberValid,
    bool? isPasswordValid,
    bool? isFormValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return UiState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      isPhoneNumberValid: isPhoneNumberValid ?? this.isPhoneNumberValid,
      isPasswordValid: isPasswordValid ?? this.isPhoneNumberValid,
      isFormValid: isFormValid ?? this.isFormValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}
