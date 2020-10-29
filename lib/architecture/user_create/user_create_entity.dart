class User {
  String name;
  String phone;
  String email;
  String address;
  int userId;
  int companyId;
  String delStatus;
  String dateOfBirth;
  String dateOfAnniversary;
  int id;
  bool status;
  String message;

  User(
      {this.name,
      this.phone,
      this.email,
      this.address,
      this.userId,
      this.companyId,
      this.delStatus,
      this.dateOfBirth,
      this.dateOfAnniversary,
      this.id,
      this.status,
      this.message});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    userId = json['user_id'];
    companyId = json['company_id'];
    delStatus = json['del_status'];
    dateOfBirth = json['date_of_birth'];
    dateOfAnniversary = json['date_of_anniversary'];
    id = json['id'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['user_id'] = this.userId;
    data['company_id'] = this.companyId;
    data['del_status'] = this.delStatus;
    data['date_of_birth'] = this.dateOfBirth;
    data['date_of_anniversary'] = this.dateOfAnniversary;
    data['id'] = this.id;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}