class LoginResponseModel {
  String expiry;
  String token;

  LoginResponseModel({
    this.expiry,
    this.token,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    expiry = json['expiry'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() => {
        'expiry': this.expiry,
        'token': this.token,
      };
}
