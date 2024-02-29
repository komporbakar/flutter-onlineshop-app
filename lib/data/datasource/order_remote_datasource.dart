import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/data/datasource/auth_local_datasource.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/requests/order_request_model.dart';
import '../models/responses/history_order_response_model.dart';
import '../models/responses/order_detail_response_model.dart';
import '../models/responses/order_response_model.dart';

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> createOrder(
      OrderRequestModel orderRequestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/orders'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData!.accessToken}',
      },
      body: orderRequestModel.toJson(),
    );
    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else {
      return Left(
          OrderResponseModel.fromJson(response.body).message! ?? 'Error');
    }
  }

  Future<Either<String, String>> checkPaymentStatus(int orderId) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/orders/$orderId/status'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData!.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return right(data['status']);
    } else {
      return const Left('Error');
    }
  }

  // Get Order By User Id
  Future<Either<String, HistoryOrderResponseModel>> getOrderByUserId() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/orders'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData!.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      // final data = jsonDecode(response.body);
      return Right(HistoryOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }

  //get order by id
  Future<Either<String, OrderDetailResponseModel>> getOrderById(int id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http
        .get(Uri.parse('${Variables.baseUrl}/api/orders/$id'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
    });
    if (response.statusCode == 200) {
      // final data = json.
      return Right(OrderDetailResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }
}
