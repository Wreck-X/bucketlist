import 'package:freezed_annotation/freezed_annotation.dart';

part 'membersListModel.freezed.dart';

@freezed
class Members with _$Members {
  factory Members({
    required List<Map<String, dynamic>> members,
  }) = _Members;

  factory Members.fromJson(Map<String, dynamic> json) {
    return Members(
        members: (json['members'] as List<dynamic>? ?? [])
            .cast<Map<String, dynamic>>());
  }
}
