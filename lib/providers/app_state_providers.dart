import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder_ui/models/achievement_details_model.dart';
import 'package:resume_builder_ui/models/education_details_model.dart';
import 'package:resume_builder_ui/models/experience_details_model.dart';

final isTemplateSelectedStateProvider = StateProvider<bool>((ref) => false);

final selectedTemplateStateProvider = StateProvider<int>((ref) => 0);

final educationDetailsListStateProvider =
    StateProvider<List<EducationDetailsModel>>((ref) => [
          EducationDetailsModel(
              schoolName: "", passingYear: "", description: "")
        ]);

final experienceDetailsListStateProvider =
    StateProvider<List<ExperienceDetailsModel>>((ref) => [
          ExperienceDetailsModel(
              companyName: "", passingYear: "", responsibility: "")
        ]);

final achievementDetailsListStateProvider =
    StateProvider<List<AchievementDetailsModel>>(
        (ref) => [AchievementDetailsModel(field: "", award: "")]);

final jobProfileStateProvider = StateProvider<String?>((ref) {
  return "";
});
final careerObjectiveStateProvider = StateProvider<String?>((ref) {
  return "";
});
final skillListStateProvider = StateProvider<List<String?>>((ref) {
  return [""];
});
