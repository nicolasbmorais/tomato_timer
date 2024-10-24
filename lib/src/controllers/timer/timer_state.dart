part of 'timer_cubit.dart';

sealed class TimerState {}

final class TimerInitial extends TimerState {}

final class TimerLoading extends TimerState {}

final class TimerLoaded extends TimerState {}

final class TimerPaused extends TimerState {}

final class TimerStarted extends TimerState {}

final class TimerCanceled extends TimerState {}

final class SettingsInitial extends TimerState {}

final class SettingsLoading extends TimerState {}

final class SettingsLoaded extends TimerState {}

final class SettingsError extends TimerState {}
