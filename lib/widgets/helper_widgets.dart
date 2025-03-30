import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:geolocator/geolocator.dart';

class UtilFunctions {
  static flutterToastFunction(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static Future<String> getDeviceDetails() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String os = "Unknown OS";
    String model = "Unknown Model";
    String name = "Unknown Name";
    String brand = "Unknown Brand";
    String browser = "Unknown Browser";

    if (UniversalPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      os = "Android ${androidInfo.version.release}";
      model = androidInfo.model;
      name = androidInfo.device;
      brand = androidInfo.brand;
    } else if (UniversalPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      os = "iOS ${iosInfo.systemVersion}";
      model = iosInfo.utsname.machine;
      name = iosInfo.name;
      brand = "Apple";
    } else if (UniversalPlatform.isMacOS) {
      MacOsDeviceInfo macInfo = await deviceInfo.macOsInfo;
      os = "macOS ${macInfo.osRelease}";
      model = macInfo.model;
      name = macInfo.computerName;
      brand = "Apple";
    } else if (UniversalPlatform.isWindows) {
      WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
      os = "Windows ${windowsInfo.productName}";
      model = windowsInfo.deviceId;
      name = windowsInfo.computerName;
      brand = "Microsoft";
    } else if (UniversalPlatform.isLinux) {
      LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
      os = "Linux ${linuxInfo.version}";
      model = linuxInfo.machineId ?? "Unknown MachineId";
      name = linuxInfo.name;
      brand = "Linux";
    } else if (UniversalPlatform.isWeb) {
      final navigator = html.window.navigator;
      os = navigator.platform ?? "Unknown OS";
      model = "Web Device";
      name = navigator.appName;
      brand = "Web";
      browser = navigator.userAgent;
    }

    return "OS: $os, Model: $model, Name: $name, Brand: $brand, Browser: $browser";
  }


  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }
  
}