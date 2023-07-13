import 'package:equatable/equatable.dart';
import 'package:etiya_case/core/extensions/string_extensions.dart';
import 'package:etiya_case/feature/agent/data/models/ability/ability_model.dart';
import 'package:etiya_case/feature/agent/data/models/role/role_model.dart';

import 'package:etiya_case/feature/agent/domain/entities/ability/ability_entity.dart';
import 'package:etiya_case/feature/agent/domain/entities/agent/agent_entity.dart';
import 'package:etiya_case/feature/agent/domain/entities/role/role_entity.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agent_model.g.dart';

@JsonSerializable(createToJson: false)
class AgentModel extends Equatable {
  /// A data model that represents agent
  const AgentModel(
    this.displayName,
    this.description,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.backgroundGradientColors,
    this.role,
    this.abilities,
  );
  factory AgentModel.fromJson(Map<String, dynamic> json) => _$AgentModelFromJson(json);

  final String? displayName;
  final String? description;
  final String? bustPortrait;
  final String? fullPortrait;
  final String? fullPortraitV2;
  final List<String>? backgroundGradientColors;
  final RoleModel? role;
  final List<AbilityModel>? abilities;

  @override
  List<Object?> get props => [
        displayName,
        description,
        bustPortrait,
        fullPortrait,
        fullPortraitV2,
        backgroundGradientColors,
        role,
        abilities,
      ];
}

extension AgentModelExtension on AgentModel {
  /// Converts the given [AgentModel] to [AgentEntity]
  AgentEntity toAgentEntity() {
    return AgentEntity(
      displayName: displayName ?? 'N/A',
      description: description ?? 'N/A',
      bustPortrait: bustPortrait ?? '',
      fullPortrait: fullPortrait ?? '',
      fullPortraitV2: fullPortraitV2 ?? '',
      backgroundGradientColors: getGradientColors(),
      role: role?.toRoleEntity() ?? const RoleEntity(displayName: 'N/A', description: 'N/A', displayIcon: 'N/A'),
      abilities: getAbilities(),
    );
  }

  List<Color> getGradientColors() {
    final gradientColors = <Color>[];
    backgroundGradientColors?.forEach((element) {
      gradientColors.add(element.toColor());
    });
    return gradientColors;
  }

  List<AbilityEntity> getAbilities() {
    return abilities?.map((element) => element.toAbilityEntity()).toList() ?? [];
  }
}
