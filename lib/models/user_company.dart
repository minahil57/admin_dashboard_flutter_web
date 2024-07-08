class UserCompany {
  int id;
  dynamic companyNo;
  String companyName;
  String logo;
  String baseDB;
  String dataDB;
  String webURL;
  String apiurl;

  UserCompany({
    required this.id,
    required this.companyNo,
    required this.companyName,
    required this.logo,
    required this.baseDB,
    required this.dataDB,
    required this.webURL,
    required this.apiurl,
  });

  factory UserCompany.fromJson(Map<String, dynamic> json) {
    return UserCompany(
      id: json['id'],
      companyNo: json['companyNo'],
      companyName: json['companyName'],
      logo: json['logo'],
      baseDB: json['baseDB'],
      dataDB: json['dataDB'],
      webURL: json['webURL'],
      apiurl: json['apiurl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyNo': companyNo,
      'companyName': companyName,
      'logo': logo,
      'baseDB': baseDB,
      'dataDB': dataDB,
      'webURL': webURL,
      'apiurl': apiurl,
    };
  }
}
