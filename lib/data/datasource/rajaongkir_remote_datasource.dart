import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';
import 'package:flutter_onlineshop_app/data/models/responses/city_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/cost_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/tracking_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/responses/province_response_model.dart';
import '../models/responses/subdistrict_response_model.dart';

class RajaongkirRemoteDatasource {
  Future<Either<String, ProvinceResponseModel>> getProvinces() async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/province');
    final response = await http.get(url, headers: {
      'key': Variables.rajaOngkirKey,
    });
    if (response.statusCode == 200) {
      return Right(ProvinceResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }

  Future<Either<String, CityResponseModel>> getCityByProvince(
      String provinceId) async {
    final url =
        Uri.parse('https://pro.rajaongkir.com/api/city?province=$provinceId');
    final response = await http.get(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
    );
    if (response.statusCode == 200) {
      return Right(CityResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }

  Future<Either<String, SubdistrictResponseModel>> getSubdistrictByCity(
      String cityId) async {
    final url =
        Uri.parse('https://pro.rajaongkir.com/api/subdistrict?city=$cityId');
    final response = await http.get(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
    );
    if (response.statusCode == 200) {
      return Right(SubdistrictResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }

  Future<Either<String, CostResponseModel>> getCost(
      String origin, String destination, String courier, int weight) async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/cost');
    final response = await http.post(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
      body: {
        'origin': origin,
        'originType': 'subdistrict',
        'destination': destination,
        'destinationType': 'subdistrict',
        'weight': weight.toString() ?? "1000",
        'courier': courier
      },
    );

    if (response.statusCode == 200) {
      return Right(CostResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }

  // tracking
  Future<Either<String, TrackingResponseModel>> tracking(
      String courier, String resi) async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/waybill');
    final response = await http.post(url, headers: {
      'key': Variables.rajaOngkirKey,
    }, body: {
      'waybill': resi,
      'courier': courier
    });

    if (response.statusCode == 200) {
      return Right(TrackingResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }
}
