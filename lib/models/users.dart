class Users {
  static String? _id;
  static String? _profileImage;
  static String? _name;
  static String? _email;
  static String? _password;
  static String? _phoneNumber;
  static String? _cnicNumber;
  static String? _userCreatedDate;
  static int? _status;

  // Users({
  //   String? id,
  //   String? profileImage,
  //   String? name,
  //   String? email,
  //   String? password,
  //   String? phoneNumber,
  //   String? cnicNumber,
  //   String? userCreatedDate,
  //   int? status,
  // })  : _profileImage = profileImage,
  //       _name = name,
  //       _email = email,
  //       _password = password,
  //       _phoneNumber = phoneNumber,
  //       _cnicNumber = cnicNumber,
  //       _status = status,
  //       _userCreatedDate = userCreatedDate;
  Users({
    String? id,
    String? profileImage,
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
    String? cnicNumber,
    String? userCreatedDate,
    int? status,
  }) {
    _id = id;
    _profileImage = profileImage;
    _name = name;
    _email = email;
    _password = password;
    _phoneNumber = phoneNumber;
    _cnicNumber = cnicNumber;
    _userCreatedDate = userCreatedDate;
    _status = status;
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      name: map["name"],
      email: map["email"],
      password: map["password"],
      phoneNumber: map["phoneNumber"],
      cnicNumber: map["cnic"],
      profileImage: map["profileImage"],
      userCreatedDate: map["createdDate"],
      status: map['status'],
      id: map['userID'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": _name,
      "email": _email,
      "password": _password,
      "phoneNumber": _phoneNumber,
      "cnic": _cnicNumber,
      "profileImage": _profileImage,
      "createdDate": _userCreatedDate,
      "status": _status
    };
  }

  factory Users.setAllFieldsNull() {
    return Users(
      name: "",
      email: "",
      password: "",
      phoneNumber: "",
      cnicNumber: "",
      profileImage: "",
      userCreatedDate: "",
      status: 0,
      id: "",
    );
  }

  static String? get getUserId => _id;
  static String? get getName => _name;
  static String? get getEmail => _email;
  static String? get getPassword => _password;
  static String? get getCnic => _cnicNumber;
  static String? get getPhoneNumber => _phoneNumber;
  static String? get getProfileImageURL => _profileImage;
  static int? get getStatus => _status;
}
