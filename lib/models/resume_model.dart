import 'package:resume_builder_ui/models/achievement_details_model.dart';
import 'package:resume_builder_ui/models/education_details_model.dart';
import 'package:resume_builder_ui/models/experience_details_model.dart';

class ResumeModel {
  String? templateId;
  PersonalInformation? personalInformation;
  String? jobTitle;
  String? careerObjective;
  List<String?>? skills;
  List<EducationDetailsModel>? education;
  List<ExperienceDetailsModel>? experience;
  List<AchievementDetailsModel>? achievements;

  ResumeModel({
    required this.templateId,
    required this.personalInformation,
    required this.jobTitle,
    required this.careerObjective,
    required this.skills,
    required this.education,
    required this.experience,
    required this.achievements,
  });

  Map<String, dynamic> toJson() => {
        "template_id": templateId,
        "personal_information": personalInformation?.toJson(),
        "job_title": jobTitle,
        "career_objective": careerObjective,
        "skills":
            skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "education": education == null
            ? []
            : List<dynamic>.from(education!.map((x) => x.toJson())),
        "experience": experience == null
            ? []
            : List<dynamic>.from(experience!.map((x) => x.toJson())),
        "achievements": achievements == null
            ? []
            : List<dynamic>.from(achievements!.map((x) => x.toJson())),
      };
}

class PersonalInformation {
  String? name;
  String? lastName;
  String? emailAddress;
  String? phoneNumber;
  String? linkedinUrl;

  PersonalInformation({
    required this.name,
    required this.lastName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.linkedinUrl,
  });

  factory PersonalInformation.fromJson(Map<String, dynamic> json) =>
      PersonalInformation(
        name: json["name"],
        lastName: json["last_name"],
        emailAddress: json["email_address"],
        phoneNumber: json["phone_number"],
        linkedinUrl: json["linkedin_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "last_name": lastName,
        "email_address": emailAddress,
        "phone_number": phoneNumber,
        "linkedin_url": linkedinUrl,
      };
}
