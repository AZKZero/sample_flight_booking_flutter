class UserModel {
  int? id;
  String? name;
  String? email;
  bool? isAdmin;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.isAdmin});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['isAdmin'] = isAdmin;
    data['name'] = name;
    return data;
  }
}

class LoginModel {
  String? email;
  String? password;

  LoginModel(
      {
      required this.email,
      required this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}