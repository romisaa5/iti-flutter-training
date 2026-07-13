import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store/core/network/api_client.dart';
import 'package:men_store/features/locations/data/models/location_model.dart'
    show LocationModel;
import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final ApiService _apiService;

  AddressCubit(this._apiService) : super(AddressInitial());

  Future<void> getLocations() async {
    emit(AddressLoading());
    try {
      final response = await _apiService.getLocations();
      final data = response.data as List;
      final locations = data
          .map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
          .toList();

      emit(
        AddressLoaded(
          locations: locations,
          selectedId: locations.isNotEmpty ? locations.first.id : null,
        ),
      );
    } catch (e) {
      emit(AddressError('حدث خطأ أثناء تحميل العناوين'));
    }
  }

  void selectAddress(int id) {
    final currentState = state;
    if (currentState is AddressLoaded) {
      emit(currentState.copyWith(selectedId: id));
    }
  }
}
