part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}
class Tabchange extends DashboardEvent{
  final int tabIndex;

  Tabchange({required this.tabIndex});
}
