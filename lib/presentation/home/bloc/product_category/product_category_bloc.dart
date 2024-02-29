import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/product_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category_bloc.freezed.dart';
part 'product_category_event.dart';
part 'product_category_state.dart';

class ProductCategoryBloc
    extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  ProductCategoryBloc(
    this._productRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetProductByCategory>((event, emit) async {
      emit(const ProductCategoryState.loading());
      final response = await _productRemoteDatasource.getProductByCategory(1);
      response.fold(
        (l) => emit(
          const ProductCategoryState.error('Internal Server Error'),
        ),
        (r) => emit(ProductCategoryState.loaded(r.data!.data!)),
      );
    });
  }
}
