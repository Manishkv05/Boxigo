import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial(tabIndex: 0)) {
    on<DashboardEvent>((event, emit) {
      // TODO: implement event handler
      if(event is Tabchange){
        emit(DashboardInitial(tabIndex: event.tabIndex));
        
      }
    });
  }
}
