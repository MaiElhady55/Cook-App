class VerifyOtpMobileData {
  String? id;
  String? username;
  String? email;
  String? mobile;
  bool? isVerified;

  VerifyOtpMobileData(
      {this.id, this.username, this.email, this.mobile, this.isVerified});

  factory VerifyOtpMobileData.fromJson(Map<String, dynamic> json) =>
      VerifyOtpMobileData(
        id: json['id'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        mobile: json['mobile'] as String?,
        isVerified: json['is_verified'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'mobile': mobile,
        'is_verified': isVerified,
      };
}
