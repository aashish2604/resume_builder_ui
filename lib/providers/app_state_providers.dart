import 'package:flutter_riverpod/flutter_riverpod.dart';

final isTemplateSelectedStateProvider = StateProvider<bool>((ref) => false);

final selectedTemplateStateProvider = StateProvider<int>((ref) => 0);
