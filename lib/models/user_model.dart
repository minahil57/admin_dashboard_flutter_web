
import 'package:getx_admin_panel/models/user_company.dart';

class UserApiResponse {
  bool status;
  UserData data;

  UserApiResponse({required this.status, required this.data});

  factory UserApiResponse.fromJson(Map<String, dynamic> json) {
    return UserApiResponse(
      status: json['status'],
      data: UserData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class UserData {
  int id;
  String userNo;
  String userName;
  String fullName;
  String email;
  String contactNo;
  String userType;
  String role;
  String profileImage;
  String branch;
  String department;
  String culture;
  String status;
  String accessToken;
  String refreshToken;
  List<UserCompany> userCompanies;

  UserData({
    required this.id,
    required this.userNo,
    required this.userName,
    required this.fullName,
    required this.email,
    required this.contactNo,
    required this.userType,
    required this.role,
    required this.profileImage,
    required this.branch,
    required this.department,
    required this.culture,
    required this.status,
    required this.accessToken,
    required this.refreshToken,
    required this.userCompanies,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    var userCompaniesJson = json['userCompanies'] as List;
    List<UserCompany> userCompaniesList = userCompaniesJson.map((i) => UserCompany.fromJson(i)).toList();

    return UserData(
      id: json['id'],
      userNo: json['userNo'],
      userName: json['userName'],
      fullName: json['fullName'],
      email: json['email'],
      contactNo: json['contactNo'],
      userType: json['userType'],
      role: json['role'],
      profileImage: json['profileImage'],
      branch: json['branch'],
      department: json['department'],
      culture: json['culture'],
      status: json['status'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      userCompanies: userCompaniesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userNo': userNo,
      'userName': userName,
      'fullName': fullName,
      'email': email,
      'contactNo': contactNo,
      'userType': userType,
      'role': role,
      'profileImage': profileImage,
      'branch': branch,
      'department': department,
      'culture': culture,
      'status': status,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'userCompanies': userCompanies.map((i) => i.toJson()).toList(),
    };
  }
}

