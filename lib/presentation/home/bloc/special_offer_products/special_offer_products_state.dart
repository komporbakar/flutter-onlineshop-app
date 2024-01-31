part of 'special_offer_products_bloc.dart';

@freezed
class SpecialOfferProductsState with _$SpecialOfferProductsState {
  const factory SpecialOfferProductsState.initial() = _Initial;
  const factory SpecialOfferProductsState.loading() = _Loading;
  const factory SpecialOfferProductsState.loaded(List<Product> products) =
      _Loaded;
  const factory SpecialOfferProductsState.error(String message) = _Error;
}
