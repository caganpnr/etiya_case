import 'package:equatable/equatable.dart';
import 'package:etiya_case/feature/agent/domain/entities/ability/ability_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ability_model.g.dart';

@JsonSerializable(createToJson: false)
class AbilityModel extends Equatable {
  /// A data model that represents ability
  const AbilityModel(this.slot, this.displayName, this.description, this.displayIcon);

  factory AbilityModel.fromJson(Map<String, dynamic> json) => _$AbilityModelFromJson(json);

  final String? slot;
  final String? displayName;
  final String? description;
  final String? displayIcon;

  @override
  List<Object?> get props => [slot, displayName, description, displayIcon];
}

extension AbilityModelExtension on AbilityModel {
  /// converts the given [AbilityModel] to [AbilityEntity]
  AbilityEntity toAbilityEntity() {
    return AbilityEntity(
      slot: slot ?? 'N/A',
      displayName: displayName ?? 'N/A',
      description: description ?? 'N/A',
      displayIcon: displayIcon ?? '',
    );
  }
}
