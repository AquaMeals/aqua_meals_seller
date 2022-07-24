class TermsAndConditionModel {
  static String? _docID;
  static String? _firstTitle;
  static String? _firstDescrition;
  static String? _secondTitle;
  static String? _secondDescrition;
  static String? _thirdTitle;
  static String? _thirdDescrition;
  static String? _fourthTitle;
  static String? _fourthDescrition;
  TermsAndConditionModel({
    String? docID,
    String? firstTitle,
    String? firstDescrition,
    String? secondTitle,
    String? secondDescrition,
    String? thirdTitle,
    String? thirdDescrition,
    String? fourthTitle,
    String? fourthDescrition,
  }) {
    _docID = docID;
    _firstTitle = firstTitle;
    _firstDescrition = firstDescrition;
    _secondTitle = secondTitle;
    _secondDescrition = secondDescrition;
    _thirdTitle = thirdTitle;
    _thirdDescrition = thirdDescrition;
    _fourthTitle = fourthTitle;
    _fourthDescrition = fourthDescrition;
  }

  factory TermsAndConditionModel.fromMap(
      {required Map<String, dynamic> map, required String? docID}) {
    return TermsAndConditionModel(
      docID: docID,
      firstTitle: map["firstTitle"],
      firstDescrition: map["firstDescrition"],
      secondTitle: map["secondTitle"]!,
      secondDescrition: map["secondDescrition"],
      thirdTitle: map["thirdTitle"],
      thirdDescrition: map["thirdDescrition"],
      fourthTitle: map["fourthTitle"],
      fourthDescrition: map['fourthDescrition'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "firstTitle": _firstTitle,
      "firstDescrition": _firstDescrition,
      "secondTitle": _secondTitle,
      "secondDescrition": _secondDescrition,
      "thirdTitle": _thirdTitle,
      "thirdDescrition": _thirdDescrition,
      "fourthTitle": _fourthTitle,
      "fourthDescrition": _fourthDescrition
    };
  }

  static String? get getDocID => _docID;
  static String? get getFirstTitle => _firstTitle;
  static String? get getFirstDescrition => _firstDescrition;
  static String? get getSecondTitle => _secondTitle;
  static String? get getSecondDescrition => _secondDescrition;
  static String? get getThirdTitle => _thirdTitle;
  static String? get getThirdDescrition => _thirdDescrition;
  static String? get getFourthTitle => _fourthTitle;
  static String? get getFourthDescrition => _fourthDescrition;
}
