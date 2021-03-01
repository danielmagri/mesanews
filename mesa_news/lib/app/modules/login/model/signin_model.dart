class SigninModel {
  SigninModel({
    this.email,
    this.password,
  });

  String email;
  String password;

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
