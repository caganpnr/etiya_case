import 'package:equatable/equatable.dart';
import 'package:etiya_case/feature/agent/domain/entities/ability/ability_entity.dart';
import 'package:etiya_case/feature/agent/domain/entities/role/role_entity.dart';
import 'package:flutter/material.dart';

class AgentEntity extends Equatable {
  /// Domain layer data class that contains Agent data
  const AgentEntity({
    required this.displayName,
    required this.description,
    required this.bustPortrait,
    required this.fullPortrait,
    required this.fullPortraitV2,
    required this.backgroundGradientColors,
    required this.role,
    required this.abilities,
  });

  final String displayName;
  final String description;
  final String bustPortrait;
  final String fullPortrait;
  final String fullPortraitV2;
  final List<Color> backgroundGradientColors;
  final RoleEntity role;
  final List<AbilityEntity> abilities;

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

  AgentEntity copyWith({
    String? displayName,
    String? description,
    String? bustPortrait,
    String? fullPortrait,
    String? fullPortraitV2,
    List<Color>? backgroundGradientColors,
    RoleEntity? role,
    List<AbilityEntity>? abilities,
  }) {
    return AgentEntity(
      displayName: displayName ?? this.displayName,
      description: description ?? this.description,
      bustPortrait: bustPortrait ?? this.bustPortrait,
      fullPortrait: fullPortrait ?? this.fullPortrait,
      fullPortraitV2: fullPortraitV2 ?? this.fullPortraitV2,
      backgroundGradientColors: backgroundGradientColors ?? this.backgroundGradientColors,
      role: role ?? this.role,
      abilities: abilities ?? this.abilities,
    );
  }
}
