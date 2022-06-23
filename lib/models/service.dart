import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  String providerUid;
  String service;
  int date;
  String providerImage;
  String providerName;

  Service(
      {required this.providerUid,
      required this.service,
      required this.date,
      required this.providerImage,
      required this.providerName});

  get getProvider => providerUid;
  get getService => service;
  get getDate => date;
  get getProviderImage => providerImage;
  get getProviderName => providerName;

  set setProvider(n) => providerUid = n;
  set setService(n) => service = n;
  set setDate(n) => date = n;
  set setProviderImage(n) => providerImage = n;
  set setProviderName(n) => providerName = n;
}
