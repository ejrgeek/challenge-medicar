class ResponseRegisterModel {
  User user;
  String token;

  ResponseRegisterModel({this.user, this.token});

  ResponseRegisterModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String firstName;
  String username;
  String email;

  User({this.firstName, this.username, this.email});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() => {'first_name': this.firstName, 'username': this.username, 'email': this.email};
}