part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class UpcomingMeetingsLoaded extends HomeState {}
final class UpcomingMeetingsError extends HomeState {}
final class UpcomingMeetingsLoading extends HomeState {}
final class DocumentsLoaded extends HomeState {}
final class DocumentsError extends HomeState {}
final class DocumentsLoading extends HomeState {}