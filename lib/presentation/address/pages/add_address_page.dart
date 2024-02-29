import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/core/components/components.dart';
import 'package:flutter_onlineshop_app/core/router/app_router.dart';
import 'package:flutter_onlineshop_app/data/models/requests/address_request_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/city_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/province_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/subdistrict_response_model.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/add_address/add_address_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/city/city_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/province/province_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/subdistrict/subdistrict_bloc.dart';
import 'package:go_router/go_router.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final firstNameController = TextEditingController();
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();

  Province selectedProvince = Province(
    province: '',
    provinceId: '',
  );
  City selectedCity = City(
    cityId: '',
  );

  Subdistrict selectedSubdistrict = Subdistrict(
    subdistrictName: '',
    subdistrictId: '',
  );

  @override
  void initState() {
    super.initState();
    context.read<ProvinceBloc>().add(const ProvinceEvent.getProvince());
  }

  @override
  Widget build(BuildContext context) {
    // final countryNotifier = ValueNotifier(country.first);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Adress'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          CustomTextField(
            controller: firstNameController,
            label: 'Nama Depan',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: addressController,
            label: 'Alamat Lengkap',
          ),
          const SpaceHeight(24.0),
          BlocBuilder<ProvinceBloc, ProvinceState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (provinces) {
                  selectedProvince = provinces.first;
                  return CustomDropdown<Province>(
                    value: selectedProvince,
                    items: provinces,
                    label: 'Pilih Provinsi',
                    onChanged: (value) {
                      setState(
                        () {
                          selectedProvince = value!;
                          context.read<CityBloc>().add(
                                CityEvent.getCityByProvice(
                                  selectedProvince.provinceId!,
                                ),
                              );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (cities) {
                  selectedCity = cities.first;
                  return CustomDropdown<City>(
                    value: selectedCity,
                    items: cities,
                    label: 'Kota/Kabupaten',
                    onChanged: (value) {
                      setState(
                        () {
                          selectedCity = value!;
                          context.read<SubdistrictBloc>().add(
                                SubdistrictEvent.getSubdistrictByCity(
                                  selectedCity.cityId!,
                                ),
                              );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          BlocBuilder<SubdistrictBloc, SubdistrictState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (subdistrict) {
                  selectedSubdistrict = subdistrict.first;
                  return CustomDropdown<Subdistrict>(
                    value: selectedSubdistrict,
                    items: subdistrict,
                    label: 'Kecamatan',
                    onChanged: (value) {
                      setState(
                        () {
                          selectedSubdistrict = value!;
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
          // CustomTextField(
          //   controller: cityController,
          //   label: 'Kota',
          // ),
          // const SpaceHeight(24.0),
          // CustomTextField(
          //   controller: provinceController,
          //   label: 'Provinsi',
          // ),
          // const SpaceHeight(24.0),
          CustomTextField(
            controller: zipCodeController,
            label: 'Kode Pos',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: phoneNumberController,
            label: 'No Handphone',
          ),
          const SpaceHeight(24.0),
          BlocConsumer<AddAddressBloc, AddAddressState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                loaded: () {
                  context.goNamed(
                    RouteConstants.address,
                    pathParameters: PathParameters(
                      rootTab: RootTab.order,
                    ).toMap(),
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return Button.filled(
                    onPressed: () {
                      context.read<AddAddressBloc>().add(
                            AddAddressEvent.addAddress(
                              addressRequestModel: AddressRequestModel(
                                name: firstNameController.text,
                                fullAddress: addressController.text,
                                provId: selectedProvince.provinceId,
                                cityId: selectedCity.cityId,
                                districtId: selectedSubdistrict.subdistrictId,
                                postalCode: zipCodeController.text,
                                phone: phoneNumberController.text,
                                isDefault: false,
                              ),
                            ),
                          );
                      // context.goNamed(
                      //   RouteConstants.address,
                      //   pathParameters: PathParameters(
                      //     rootTab: RootTab.order,
                      //   ).toMap(),
                      // );
                    },
                    label: 'Tambah Alamat',
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
