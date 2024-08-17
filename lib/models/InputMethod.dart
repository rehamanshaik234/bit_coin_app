/// method : "SUBSCRIBE"
/// params : ["all@ticker"]
/// cid : 1

class InputMethod {
  InputMethod({
      String? method, 
      List<String>? params, 
      num? cid,}){
    _method = method;
    _params = params;
    _cid = cid;
}

  InputMethod.fromJson(dynamic json) {
    _method = json['method'];
    _params = json['params'] != null ? json['params'].cast<String>() : [];
    _cid = json['cid'];
  }
  String? _method;
  List<String>? _params;
  num? _cid;
InputMethod copyWith({  String? method,
  List<String>? params,
  num? cid,
}) => InputMethod(  method: method ?? _method,
  params: params ?? _params,
  cid: cid ?? _cid,
);
  String? get method => _method;
  List<String>? get params => _params;
  num? get cid => _cid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['method'] = _method;
    map['params'] = _params;
    map['cid'] = _cid;
    return map;
  }

}