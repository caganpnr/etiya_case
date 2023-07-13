// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentModel _$AgentModelFromJson(Map<String, dynamic> json) => AgentModel(
      json['displayName'] as String?,
      json['description'] as String?,
      json['bustPortrait'] as String?,
      json['fullPortrait'] as String?,
      json['fullPortraitV2'] as String?,
      (json['backgroundGradientColors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['role'] == null
          ? null
          : RoleModel.fromJson(json['role'] as Map<String, dynamic>),
      (json['abilities'] as List<dynamic>?)
          ?.map((e) => AbilityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
