// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../x_dashboards.dart';

// part 'grocery_event.dart';
// part 'grocery_state.dart';

// class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
//   GroceryBloc() : super(GroceryInitialState()) {
//     on<GroceryInitialEvent>(handleGoceryInitialEvent);
//     on<GroceryInitialFetchEvent>(handleFetchGocery);
//     on<GroceryAddEvent>(handleAddGocery);
//   }

//   Future<void> handleGoceryInitialEvent(event, emit) async {
//     print('handleGoceryInitialEvent Clicked');
//   }

//   Future<void> handleFetchGocery(event, emit) async {
//     emit(GroceryFetchLoadingState());
//     // await Future.delayed(Duration(seconds: 3));
//     List<GroceryModel> dtGrocery = await GroceryService.fetchData();
//     emit(GroceryFetchSuccessState(data: dtGrocery));
//   }

//   Future<void> handleAddGocery(
//       GroceryAddEvent event, Emitter<GroceryState> emit) async {
//     bool success = await GroceryService.addData();
  
//     if (success) {
//       emit(GroceryAdditionSuccessState());
//     } else {
//       emit(GroceryAdditionErrorState());
//     }
//   }
// }