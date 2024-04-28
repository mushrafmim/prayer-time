class SettingsModel {
  bool isEasternTime;

  SettingsModel({
    this.isEasternTime = false,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      isEasternTime: json['isEasternTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isEasternTime': isEasternTime,
    };
  }
}