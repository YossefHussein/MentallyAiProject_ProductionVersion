abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class SignInEmailState extends AuthStates {}

class OpenSignUpScreen extends AuthStates{}

class SignUpIsMatchState extends AuthStates {}


class LoginWithGoogleLoading extends AuthStates{}

class LoginWithGoogleError extends AuthStates{
  String error;
  LoginWithGoogleError(this.error);
}

class LoginWithGoogleComplete extends AuthStates{}
