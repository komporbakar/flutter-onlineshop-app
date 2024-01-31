import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/product_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'best_seller_product_bloc.freezed.dart';
part 'best_seller_product_event.dart';
part 'best_seller_product_state.dart';

class BestSellerProductBloc
    extends Bloc<BestSellerProductEvent, BestSellerProductState> {
  final ProductRemoteDatasource _productRemoteDataSource;
  BestSellerProductBloc(
    this._productRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetBestSellerProducts>((event, emit) async {
      final response = await _productRemoteDataSource.getProductByCategory(1);
      response.fold(
        (l) => emit(
          const BestSellerProductState.error('Internal Server Error'),
        ),
        (r) => emit(
          BestSellerProductState.loaded(r.data!.data!),
        ),
      );
    });
  }
}
