class ExperienceDetailsModel {
  String? companyName;
  String? passingYear;
  String? responsibility;

  ExperienceDetailsModel(
      {required this.companyName,
      required this.passingYear,
      required this.responsibility});

  Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "passing_year": passingYear,
        "responsibilities": responsibility,
      };
}
