import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/product_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'special_offer_products_bloc.freezed.dart';
part 'special_offer_products_event.dart';
part 'special_offer_products_state.dart';

class SpecialOfferProductsBloc
    extends Bloc<SpecialOfferProductsEvent, SpecialOfferProductsState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  SpecialOfferProductsBloc(
    this._productRemoteDatasource,
  ) : super(const _Initial()) {
    on<SpecialOfferProductsEvent>((event, emit) async {
      emit(const SpecialOfferProductsState.loading());
      final response = await _productRemoteDatasource.getProductByCategory(3);
      response.fold(
        (l) => emit(
            const SpecialOfferProductsState.error('Internal Server Error')),
        (r) => emit(SpecialOfferProductsState.loaded(r.data!.data!)),
      );
    });
  }
}
