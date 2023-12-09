import 'package:freezed_annotation/freezed_annotation.dart';

part 'statusUpdates.freezed.dart';

@freezed
class StatusUpdates with _$StatusUpdates {
  factory StatusUpdates({required List<Map<String, dynamic>> Updates}) =
      _StatusUpdates;

  factory StatusUpdates.fromJson(Map<String, dynamic> json) {
    return StatusUpdates(
      Updates: (json['status_update'] as List<dynamic>? ?? [])
          .cast<Map<String, dynamic>>(),
    );
  }
}
