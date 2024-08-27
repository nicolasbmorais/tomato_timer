part of 'settings_cubit.dart';

sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SettingsLoading extends SettingsState {}

final class SettingsLoaded extends SettingsState {}

final class SettingsError extends SettingsState {}
