class AchievementDetailsModel {
  String? field;
  String? award;
  AchievementDetailsModel({required this.field, required this.award});

  Map<String, dynamic> toJson() => {
        "field": field,
        "awards": award,
      };
}
