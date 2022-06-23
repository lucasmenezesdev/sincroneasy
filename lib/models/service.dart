import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  String providerUid;
  String service;
  Timestamp date;

  Service({
    required this.providerUid,
    required this.service,
    required this.date,
  });

  get getProvider => providerUid;
  get getService => service;
  get getDate => date;

  set setProvider(n) => providerUid = n;
  set setService(n) => service = n;
  set setDate(n) => date = n;
}
