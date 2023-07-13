import 'package:equatable/equatable.dart';

class RoleEntity extends Equatable {
  /// Domain layer data class that contains Role data
  const RoleEntity({
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  final String displayName;
  final String description;
  final String displayIcon;

  @override
  List<Object?> get props => [displayName, description, displayIcon];

  RoleEntity copyWith({
    String? displayName,
    String? description,
    String? displayIcon,
  }) {
    return RoleEntity(
      displayName: displayName ?? this.displayName,
      description: description ?? this.description,
      displayIcon: displayIcon ?? this.displayIcon,
    );
  }
}
