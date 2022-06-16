class Service {
  String provider;
  String client;
  String service;
  String date;
  String hour;

  Service(
      {required this.provider,
      required this.client,
      required this.service,
      required this.date,
      required this.hour});

  get getProvider => provider;
  get getClient => client;
  get getService => service;
  get getDate => date;
  get getHour => hour;

  set setProvider(n) => provider = n;
  set setClient(n) => client = n;
  set setService(n) => service = n;
  set setDate(n) => date = n;
  set setHour(n) => hour = n;
}
