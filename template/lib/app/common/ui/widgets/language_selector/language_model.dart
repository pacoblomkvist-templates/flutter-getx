class LanguageModel {
  String? iso;
  String? name;
  String? nameNative;
  String? flag;

  LanguageModel({this.iso, this.name, this.nameNative, this.flag});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    iso = json['iso'];
    name = json['name'];
    nameNative = json['name_native'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso'] = this.iso;
    data['name'] = this.name;
    data['name_native'] = this.nameNative;
    data['flag'] = this.flag;
    return data;
  }
}
