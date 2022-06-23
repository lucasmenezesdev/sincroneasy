class Service {
  String providerUid;
  String clientUid;
  String service;
  String date;
  String hour;

  Service(
      {required this.providerUid,
      required this.clientUid,
      required this.service,
      required this.date,
      required this.hour});

  get getProvider => providerUid;
  get getClient => clientUid;
  get getService => service;
  get getDate => date;
  get getHour => hour;

  set setProvider(n) => providerUid = n;
  set setClient(n) => clientUid = n;
  set setService(n) => service = n;
  set setDate(n) => date = n;
  set setHour(n) => hour = n;
}
