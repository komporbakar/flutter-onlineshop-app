import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';
import 'package:flutter_onlineshop_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/requests/address_request_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/address_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/district_detail_response_model.dart';
import 'package:http/http.dart' as http;

class AddressRemoteDataSource {
  Future<Either<String, AddressResponseModel>> getAddresses() async {
    try {
      final authData = await AuthLocalDataSource().getAuthData();
      final response = await http
          .get(Uri.parse('${Variables.baseUrl}/api/addresses'), headers: {
        'Authorization': 'Bearer ${authData!.accessToken}',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        return Right(AddressResponseModel.fromJson(response.body));
      } else {
        return const Left('Error');
      }
    } catch (e) {
      return const Left('Error');
    }
  }

  Future<Either<String, String>> addAddress(AddressRequestModel data) async {
    try {
      final authData = await AuthLocalDataSource().getAuthData();
      final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/addresses'),
        headers: {
          'Authorization': 'Bearer ${authData!.accessToken}',
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: data.toJson(),
      );
      if (response.statusCode == 201) {
        return const Right('Success');
      } else {
        return const Left('Error');
      }
    } catch (e) {
      return const Left('Error');
    }
  }

  Future<Either<String, DistrictDetailResponseModel>> getDistricts(
      String districtId) async {
    try {
      final authData = await AuthLocalDataSource().getAuthData();
      final response = await http.get(
        Uri.parse(
          '${Variables.baseUrl}/api/districts/$districtId',
        ),
        headers: {
          'Authorization': 'Bearer ${authData!.accessToken}',
          'Accept': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        return Right(DistrictDetailResponseModel.fromJson(response.body));
      } else {
        return const Left('Error');
      }
    } catch (e) {
      return const Left('Error');
    }
  }
}
