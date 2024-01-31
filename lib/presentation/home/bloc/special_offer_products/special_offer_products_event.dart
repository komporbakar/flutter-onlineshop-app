part of 'special_offer_products_bloc.dart';

@freezed
class SpecialOfferProductsEvent with _$SpecialOfferProductsEvent {
  const factory SpecialOfferProductsEvent.started() = _Started;
  const factory SpecialOfferProductsEvent.getSpecialOfferProducts() =
      _GetSpecialOfferProducts;
}
