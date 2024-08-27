part of 'timer_cubit.dart';

sealed class TimerState {}

final class TimerInitial extends TimerState {}

final class TimerLoading extends TimerState {}

final class TimerLoaded extends TimerState {}

final class TimerPaused extends TimerState {}

final class TimerStarted extends TimerState {}

final class TimerCanceled extends TimerState {}
