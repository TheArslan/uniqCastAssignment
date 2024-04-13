class Channel {
  int? _id;
  String? _uid;
  int? _position;
  String? _type;
  String? _resolution;
  bool? _isMcast;
  bool? _isOtt;
  bool? _isDvbt;
  String? _urlMcast;

  bool? _recordable;
  int? _recDuration;
  bool? _timeshiftable;
  int? _tsRecDuration;
  bool? _parentalHidden;
  String? _dvbtTag;
  String? _streamPriority;

  String? _metadata;
  bool? _highlightsEnabled;
  String? _ottType;
  String? _name;
  String? _shortName;
  String? _epgChannel;
  Logos? _logos;

  String? _cmChannel;

  channel(
      {int? id,
      String? uid,
      int? position,
      String? type,
      String? resolution,
      bool? isMcast,
      bool? isOtt,
      bool? isDvbt,
      String? urlMcast,
      bool? recordable,
      int? recDuration,
      bool? timeshiftable,
      int? tsRecDuration,
      bool? parentalHidden,
      String? dvbtTag,
      String? streamPriority,
      String? metadata,
      bool? highlightsEnabled,
      String? ottType,
      String? name,
      String? shortName,
      String? epgChannel,
      Logos? logos,
      String? cmChannel}) {
    _id = id;

    _uid = uid;

    _position = position;

    _type = type;

    _resolution = resolution;

    _isMcast = isMcast;

    _isOtt = isOtt;

    _isDvbt = isDvbt;

    _urlMcast = urlMcast;

    _recordable = recordable;

    _recDuration = recDuration;

    _timeshiftable = timeshiftable;

    _tsRecDuration = tsRecDuration;

    _parentalHidden = parentalHidden;

    _dvbtTag = dvbtTag;

    _streamPriority = streamPriority;

    _metadata = metadata;

    _highlightsEnabled = highlightsEnabled;

    _ottType = ottType;

    _name = name;

    _shortName = shortName;

    _epgChannel = epgChannel;

    _logos = logos;

    _cmChannel = cmChannel;
  }

  int? get id => _id;

  String? get uid => _uid;

  int? get position => _position;

  String? get type => _type;

  String? get resolution => _resolution;

  bool? get isMcast => _isMcast;

  bool? get isOtt => _isOtt;

  bool? get isDvbt => _isDvbt;

  String? get urlMcast => _urlMcast;

  bool? get recordable => _recordable;

  int? get recDuration => _recDuration;

  bool? get timeshiftable => _timeshiftable;

  int? get tsRecDuration => _tsRecDuration;

  bool? get parentalHidden => _parentalHidden;

  String? get dvbtTag => _dvbtTag;

  String? get streamPriority => _streamPriority;

  String? get metadata => _metadata;

  bool? get highlightsEnabled => _highlightsEnabled;

  String? get ottType => _ottType;

  String? get name => _name;

  String? get shortName => _shortName;

  String? get epgChannel => _epgChannel;

  Logos? get logos => _logos;

  String? get cmChannel => _cmChannel;

  Channel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _uid = json['uid'];
    _position = json['position'];
    _type = json['type'];
    _resolution = json['resolution'];
    _isMcast = json['is_mcast'];
    _isOtt = json['is_ott'];
    _isDvbt = json['is_dvbt'];
    _urlMcast = json['url_mcast'];

    _recordable = json['recordable'];
    _recDuration = json['rec_duration'];
    _timeshiftable = json['timeshiftable'];
    _tsRecDuration = json['ts_rec_duration'];
    _parentalHidden = json['parental_hidden'];
    _dvbtTag = json['dvbt_tag'];
    _streamPriority = json['stream_priority'];

    _metadata = json['metadata'];
    _highlightsEnabled = json['highlights_enabled'];
    _ottType = json['ott_type'];
    _name = json['name'];
    _shortName = json['short_name'];
    _epgChannel = json['epg_channel'];
    _logos = json['logos'] != null ? Logos.fromJson(json['logos']) : null;

    _cmChannel = json['cm_channel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['uid'] = _uid;
    data['position'] = _position;
    data['type'] = _type;
    data['resolution'] = _resolution;
    data['is_mcast'] = _isMcast;
    data['is_ott'] = _isOtt;
    data['is_dvbt'] = _isDvbt;
    data['url_mcast'] = _urlMcast;

    data['recordable'] = _recordable;
    data['rec_duration'] = _recDuration;
    data['timeshiftable'] = _timeshiftable;
    data['ts_rec_duration'] = _tsRecDuration;
    data['parental_hidden'] = _parentalHidden;
    data['dvbt_tag'] = _dvbtTag;
    data['stream_priority'] = _streamPriority;

    data['metadata'] = _metadata;
    data['highlights_enabled'] = _highlightsEnabled;
    data['ott_type'] = _ottType;
    data['name'] = _name;
    data['short_name'] = _shortName;
    data['epg_channel'] = _epgChannel;
    if (_logos != null) {
      data['logos'] = _logos!.toJson();
    }

    data['cm_channel'] = _cmChannel;
    return data;
  }
}

class Logos {
  int? _cARD;

  int? _nORMAL;
  int? _sHADOW;

  Logos({int? cARD, int? nORMAL, int? sHADOW}) {
    _cARD = cARD;

    _nORMAL = nORMAL;

    _sHADOW = sHADOW;
  }

  int? get cARD => _cARD;

  int? get nORMAL => _nORMAL;

  int? get sHADOW => _sHADOW;

  Logos.fromJson(Map<String, dynamic> json) {
    _cARD = json['CARD'];

    _nORMAL = json['NORMAL'];
    _sHADOW = json['SHADOW'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['CARD'] = _cARD;

    data['NORMAL'] = _nORMAL;
    data['SHADOW'] = _sHADOW;
    return data;
  }
}
