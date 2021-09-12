class User {
  int id;
  String name;
  String email;
  String phone;

  User(this.id, this.name, this.email, this.phone);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['name'],
      json['email'],
      json['phone'],
    );
  }
}
