import 'package:equatable/equatable.dart';
import 'package:etiya_case/feature/agent/domain/entities/role/role_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role_model.g.dart';

@JsonSerializable(createToJson: false)
class RoleModel extends Equatable {
  /// A data model that represents role
  const RoleModel(this.displayName, this.description, this.displayIcon);

  factory RoleModel.fromJson(Map<String, dynamic> json) => _$RoleModelFromJson(json);

  final String? displayName;
  final String? description;
  final String? displayIcon;

  @override
  List<Object?> get props => [displayName, description, displayIcon];
}

extension RoleModelExtension on RoleModel {
  /// converts the given [RoleModel] to [RoleEntity]
  RoleEntity toRoleEntity() {
    return RoleEntity(
      displayName: displayName ?? 'N/A',
      description: description ?? 'N/A',
      displayIcon: displayIcon ?? '',
    );
  }
}
