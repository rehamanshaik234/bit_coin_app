/// stream : "all@fpTckr"
/// data : [{"T":"fpTckr","s":"BTCINR","p":"-1351.78000000","P":"-2.740","c":"3615589.2020","o":"3717432.3072","h":"3744326.4270","l":"3595768.0014","b":"3615139.4222","a":"3615372.2228"},{"T":"Ticker","s":"ETHINR","p":"-188.41000000","P":"-4.488","c":"302113.4000","o":"316308.2094","h":"320058.6346","l":"300351.9508","b":"302074.9766","a":"302113.4000"},null]

class BitCoin {
  BitCoin({
      String? stream, 
      List<Data>? data,}){
    _stream = stream;
    _data = data;
}

  BitCoin.fromJson(dynamic json) {
    _stream = json['stream'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _stream;
  List<Data>? _data;
BitCoin copyWith({  String? stream,
  List<Data>? data,
}) => BitCoin(  stream: stream ?? _stream,
  data: data ?? _data,
);
  String? get stream => _stream;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stream'] = _stream;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// T : "fpTckr"
/// s : "BTCINR"
/// p : "-1351.78000000"
/// P : "-2.740"
/// c : "3615589.2020"
/// o : "3717432.3072"
/// h : "3744326.4270"
/// l : "3595768.0014"
/// b : "3615139.4222"
/// a : "3615372.2228"

class Data {
  Data({
      String? t, 
      String? s, 
      String? p, 
      String? P,
      String? c, 
      String? o, 
      String? h, 
      String? l, 
      String? b, 
      String? a,}){
    _t = t;
    _s = s;
    _p = p;
    _p = p;
    _c = c;
    _o = o;
    _h = h;
    _l = l;
    _b = b;
    _a = a;
}

  Data.fromJson(dynamic json) {
    _t = json['T'];
    _s = json['s'];
    _p = json['p'];
    _P = json['P'];
    _c = json['c'];
    _o = json['o'];
    _h = json['h'];
    _l = json['l'];
    _b = json['b'];
    _a = json['a'];
  }
  String? _t;
  String? _s;
  String? _p;
  String? _P;
  String? _c;
  String? _o;
  String? _h;
  String? _l;
  String? _b;
  String? _a;
Data copyWith({  String? t,
  String? s,
  String? p,
  String? P,
  String? c,
  String? o,
  String? h,
  String? l,
  String? b,
  String? a,
}) => Data(  t: t ?? _t,
  s: s ?? _s,
  p: p ?? _p,
  P: p ?? _p,
  c: c ?? _c,
  o: o ?? _o,
  h: h ?? _h,
  l: l ?? _l,
  b: b ?? _b,
  a: a ?? _a,
);
  String? get t => _t;
  String? get s => _s;
  String? get p => _p;
  String? get P => _P;
  String? get c => _c;
  String? get o => _o;
  String? get h => _h;
  String? get l => _l;
  String? get b => _b;
  String? get a => _a;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['T'] = _t;
    map['s'] = _s;
    map['p'] = _p;
    map['P'] = _p;
    map['c'] = _c;
    map['o'] = _o;
    map['h'] = _h;
    map['l'] = _l;
    map['b'] = _b;
    map['a'] = _a;
    return map;
  }

}