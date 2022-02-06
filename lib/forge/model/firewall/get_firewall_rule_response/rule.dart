import 'package:freezed_annotation/freezed_annotation.dart';

part 'rule.freezed.dart';
part 'rule.g.dart';

@freezed
class Rule with _$Rule {
  factory Rule({
    int? id,
    String? name,
    int? port,
    String? type,
    @JsonKey(name: 'ip_address') dynamic ipAddress,
    String? status,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _Rule;

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);
}
