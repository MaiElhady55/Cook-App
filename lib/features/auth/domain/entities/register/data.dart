class Data {
  String? username;
  String? email;

  Data({this.username, this.email});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json['username'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
      };
}
