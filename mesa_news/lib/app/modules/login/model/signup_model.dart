class SignupModel {
  SignupModel({
    this.name,
    this.email,
    this.password,
    this.birthday,
  });

  String name;
  String email;
  String password;
  String birthday;

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "birthday": birthday,
      };
}
