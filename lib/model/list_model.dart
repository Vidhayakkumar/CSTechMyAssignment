class ListModel {
  int? pending;
  int? called;
  int? rescheduled;
  List<Calls>? calls;

  ListModel({this.pending, this.called, this.rescheduled, this.calls});

  ListModel.fromJson(Map<String, dynamic> json) {
    pending = json['pending'];
    called = json['called'];
    rescheduled = json['rescheduled'];
    if (json['calls'] != null) {
      calls = <Calls>[];
      json['calls'].forEach((v) {
        calls!.add(new Calls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pending'] = this.pending;
    data['called'] = this.called;
    data['rescheduled'] = this.rescheduled;
    if (this.calls != null) {
      data['calls'] = this.calls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Calls {
  String? firstName;
  String? lastName;
  String? title;
  int? phone;
  int? otherPhone1;
  int? otherPhone2;
  int? otherPhone3;
  int? otherPhone4;
  String? email;
  String? address;
  String? company;
  int? age;
  int? zip;
  String? maritalStatus;
  String? notes;
  String? calledAt;
  String? rescheduledAt;
  String? createdAt;
  String? status;
  String? agentName;
  String? agentId;
  int? duration;
  String? feedback;

  Calls(
      {this.firstName,
        this.lastName,
        this.title,
        this.phone,
        this.otherPhone1,
        this.otherPhone2,
        this.otherPhone3,
        this.otherPhone4,
        this.email,
        this.address,
        this.company,
        this.age,
        this.zip,
        this.maritalStatus,
        this.notes,
        this.calledAt,
        this.rescheduledAt,
        this.createdAt,
        this.status,
        this.agentName,
        this.agentId,
        this.duration,
        this.feedback});

  Calls.fromJson(Map<String, dynamic> json) {
    firstName = json['FirstName'];
    lastName = json['LastName'];
    title = json['Title'];
    phone = json['Phone'];
    otherPhone1 = json['Other Phone 1'];
    otherPhone2 = json['Other Phone 2'];
    otherPhone3 = json['Other Phone 3'];
    otherPhone4 = json['Other Phone 4'];
    email = json['Email'];
    address = json['Address'];
    company = json['Company'];
    age = json['Age'];
    zip = json['Zip'];
    maritalStatus = json['MaritalStatus'];
    notes = json['Notes'];
    calledAt = json['calledAt'];
    rescheduledAt = json['rescheduledAt'];
    createdAt = json['createdAt'];
    status = json['status'];
    agentName = json['agentName'];
    agentId = json['agentId'];
    duration = json['duration'];
    feedback = json['feedback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Title'] = this.title;
    data['Phone'] = this.phone;
    data['Other Phone 1'] = this.otherPhone1;
    data['Other Phone 2'] = this.otherPhone2;
    data['Other Phone 3'] = this.otherPhone3;
    data['Other Phone 4'] = this.otherPhone4;
    data['Email'] = this.email;
    data['Address'] = this.address;
    data['Company'] = this.company;
    data['Age'] = this.age;
    data['Zip'] = this.zip;
    data['MaritalStatus'] = this.maritalStatus;
    data['Notes'] = this.notes;
    data['calledAt'] = this.calledAt;
    data['rescheduledAt'] = this.rescheduledAt;
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    data['agentName'] = this.agentName;
    data['agentId'] = this.agentId;
    data['duration'] = this.duration;
    data['feedback'] = this.feedback;
    return data;
  }
}