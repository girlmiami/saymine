class EndUser {
  String? userName;
  late String userId;
  DateTime? creationDate;
  late String email;
  String? phoneNumber;

  EndUser({
    this.userName,
    required this.userId,
    this.creationDate,
    required this.email,
    this.phoneNumber,
  });

  EndUser.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userId = json['userId'];
    creationDate = json['creationDate'].toDate();
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['userId'] = this.userId;
    data['creationDate'] = this.creationDate;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
