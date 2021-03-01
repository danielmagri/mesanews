class TokenModel {
  TokenModel({
    this.token,
  });

  String token;

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        token: json['token'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
