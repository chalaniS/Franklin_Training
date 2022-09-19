class User {
  final String name;
  final String email;
  final String image;

  var length;

  User(this.name, this.email, this.image);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        image = json['avator'] {
    // TODO: implement User.fromJson
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'avator': image,
      };

  toList() {}
}
