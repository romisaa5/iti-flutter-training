import '../../data/models/location_model.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final List<LocationModel> locations;
  final int? selectedId;

  AddressLoaded({required this.locations, required this.selectedId});

  AddressLoaded copyWith({List<LocationModel>? locations, int? selectedId}) {
    return AddressLoaded(
      locations: locations ?? this.locations,
      selectedId: selectedId ?? this.selectedId,
    );
  }
}

class AddressError extends AddressState {
  final String message;

  AddressError(this.message);
}
