class UserLoginModel {
  String username;
  String password;

  UserLoginModel({
    this.username,
    this.password,
  });

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() => {
        'username': this.username,
        'password': this.password,
      };
}
