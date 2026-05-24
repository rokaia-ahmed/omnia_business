part of 'calendar_cubit.dart';

@immutable
sealed class CalendarState {}

final class CalendarInitial extends CalendarState {}
final class CalendarLoading extends CalendarState {}
final class CalendarLoaded extends CalendarState {}
final class CalendarError extends CalendarState {}

