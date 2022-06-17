class ChatMessages {
  late String _fromUID;
  late String _toUID;
  late String _fromImage;
  late String _toImage;
  late String _fromName;
  late String _toName;
  late String _textMessage;
  late bool _viewed;
  late double _timestamp;

  get getFromUID => _fromUID;
  get getToUID => _toUID;
  get getFromImage => _fromImage;
  get getToImage => _toImage;
  get getFromName => _fromName;
  get getToName => _toName;
  get getTextMessage => _textMessage;
  get getViewed => _viewed;
  get getTimestamp => _timestamp;

  set setFromUID(n) => _fromUID = n;
  set setToUID(n) => _toUID = n;
  set setFromImage(n) => _fromImage = n;
  set setToImage(n) => _toImage = n;
  set setFromName(n) => _fromName = n;
  set setToName(n) => _toName = n;
  set setTextMessage(n) => _textMessage = n;
  set setViewed(n) => _viewed = n;
  set setTimestamp(n) => _timestamp = n;
}
