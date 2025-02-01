class AppStrings {
  static  String token = '';
  static const String cacheFailure = 'Cache Failure';
  //static const String lang = 'en';
  static const String noRouteFound = 'no screen Found';
  static const String serverFailureMsg = 'Please try again later .';
  static const String offLineFailureMsg = 'Please Check your Internet Connection';
  static const String emptyCacheFailureMsg = 'No Data';
  static const String unexpectedFailureMsg ='Unexpected Error, Please try again later';
  static const String loginSuccessMsg = 'Login successfully';
  static const String registerSuccessMsg = 'Register successfully';
  static const String passwordNotMatchMsg = 'Password Not Match';
  static const String badCredentialsMsg = 'Email or password wrong';
  static const String nationalIdMsg = "could not execute statement; SQL [n/a]; constraint [users.index_nationalId]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement";


  //Authentication
  static String authenticationTitle = "Insurance service for travellers abroad";
  static String emailTextFieldAuth = "E-mail";
  static String emailTextFieldAuthValidator = "Enter a valid email address";
  static String nationalIdTextFieldAuthValidator = "Enter a valid National ID";
  static String passwordTextFieldAuth = "Password";
  static String passwordTextFieldAuthValidator = "Enter valid password";
  static String passwordLengthTextFieldAuthValidator = "Must be at least 8 characters";

  //Login Screen
  static String loginTitle = "Login";
  static String rememberMeButton = "Remember Me";
  static String forgotPasswordButton = "Forgot Password?";
  static String loginButton = "Login";
  static String notMemberButton = "Not a member yet?";
  static String regLoginButton = "Register Now";

  //Forgot Password Screen
  static String forgotTitle = "Forgot Password";

  //Code With Email Screen
  static String codeTitle = "Code with E-mail";

  //Reset Password Screen
  static String resetPasswordTitle = "Code with E-mail";
  static String resetPasswordHint1 = "New Password";
  static String resetPasswordHint2 = "Confirm New Password";


  //Register Screen
  static String registerTitle = "Register Account";
  static String nationalIDTextField = "National ID";
  static String confirmPasswordTextField = "Confirm Password";
  static String registerButton = "Register";
  static String memberButton = "You\'re a member?";
  static String logRegisterButton = "Login Now";

  //Emergency Request Screen
  static String phoneTextFieldValidator = "Enter valid phone number";
  static String descriptionTextFieldValidator = "Enter valid description";
  static String locationValidator = "Set your location";

  //Activate Insurance Number Screen
  static String activateInsuranceNumber = "Activate another\ninsurance number";
  static String identificationNumberTextField = "Identification Number";
  static String termOfInsuranceTextField = "National ID";

  //Profile Screen
  static const String documentNumber = "Document number";


  // error handler
  static const String success = "success";
  static const String badRequestError = "bad_request_error";
  static const String noContent = "no_content";
  static const String forbiddenError = "forbidden_error";
  static const String unauthorizedError = "unauthorized_error";
  static const String notFoundError = "not_found_error";
  static const String conflictError = "conflict_error";
  static const String internalServerError = "internal_server_error";
  static const String unknownError = "unknown_error";
  static const String timeoutError = "timeout_error";
  static const String defaultError = "default_error";
  static const String cacheError = "cache_error";
  static const String noInternetError = "no_internet_error";
}

