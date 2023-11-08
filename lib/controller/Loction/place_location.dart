import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class PlaceLocation extends GetxController {
  final _currentAddress = ''.obs;
  TextEditingController studentPhone = TextEditingController();
  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;
  String get currentAddress => _currentAddress.value;
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
        "Location Permission Denied",
        "Location permissions are denied",
        backgroundColor:
            Colors.red, // You can customize the snackbar appearance
        colorText: Colors.white,
      );
      // return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar(
          "Location Permission Denied",
          "Location permissions are denied",
          backgroundColor:
              Colors.red, // You can customize the snackbar appearance
          colorText: Colors.white,
        );
        // return false;
      }
    } else if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        "Location Permission Denied",
        "Location permissions are denied",
        backgroundColor:
            Colors.red, // You can customize the snackbar appearance
        colorText: Colors.white,
      );
      // return false;
    } else {
      return true;
    }
    return false;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) {
      _handleLocationPermission();
    }
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _currentPosition = position;
    // studentPhone.text = position.toString );
    _getAddressFromLatLng(position);
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks[0];
        studentPhone.text =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      }
    } catch (e) {
      print(e);
    }
  }
}
