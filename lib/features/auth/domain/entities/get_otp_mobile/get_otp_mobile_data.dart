class GetOtpMobileData {
  String? userId;
  bool? isVerified;

  GetOtpMobileData({this.userId, this.isVerified});

  factory GetOtpMobileData.fromJson(Map<String, dynamic> json) =>
      GetOtpMobileData(
        userId: json['user_id'] as String?,
        isVerified: json['is_verified'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'is_verified': isVerified,
      };
}
