import 'package:equatable/equatable.dart';

class AbilityEntity extends Equatable {
  /// Domain layer data class that contains Ability data
  const AbilityEntity({
    required this.slot,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  final String slot;
  final String displayName;
  final String description;
  final String displayIcon;

  @override
  List<Object?> get props => [slot, displayName, description, displayIcon];

  AbilityEntity copyWith({
    String? slot,
    String? displayName,
    String? description,
    String? displayIcon,
  }) {
    return AbilityEntity(
      slot: slot ?? this.slot,
      displayName: displayName ?? this.displayName,
      description: description ?? this.description,
      displayIcon: displayIcon ?? this.displayIcon,
    );
  }
}
