class LoginData {
  String? userId;
  String? username;
  String? email;
  bool? isVerified;

  LoginData({this.userId, this.username, this.email, this.isVerified});

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        userId: json['user_id'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        isVerified: json['is_verified'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'username': username,
        'email': email,
        'is_verified': isVerified,
      };
}
