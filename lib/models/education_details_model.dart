class EducationDetailsModel {
  String? schoolName;
  String? passingYear;
  String? description;
  EducationDetailsModel(
      {required this.schoolName,
      required this.passingYear,
      required this.description});

  Map<String, dynamic> toJson() => {
        "school_name": schoolName,
        "passing_year": passingYear,
        "description": description,
      };
}
