class EmployeeModel {
  String? sId;
  String? name;
  String? email;
  String? mobile;
  String? dob;
  String? doj;
  String? createdAt;
  String? updatedAt;
  int? iV;

  EmployeeModel(
      {this.sId,
        this.name,
        this.email,
        this.mobile,
        this.dob,
        this.doj,
        this.createdAt,
        this.updatedAt,
        this.iV});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    dob = json['dob'];
    doj = json['doj'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['dob'] = this.dob;
    data['doj'] = this.doj;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
