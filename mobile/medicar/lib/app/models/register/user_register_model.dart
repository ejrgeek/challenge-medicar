class UserRegisterModel {
  String firstName;
  String username;
  String email;
  String password;

  UserRegisterModel({
    this.firstName,
    this.username,
    this.email,
    this.password,
  });

  UserRegisterModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() => {
        'first_name': this.firstName,
        'username': this.username,
        'email': this.email,
        'password': this.password,
      };
}
