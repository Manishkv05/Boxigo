part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {
  final int tabIndex;

  DashboardState({required this.tabIndex});
}

final class DashboardInitial extends DashboardState {
  DashboardInitial({required super.tabIndex});
}
