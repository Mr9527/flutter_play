typedef void EventCallback(callbakc);

class EventBus {
  //私有化构造函数
  EventBus._internal();

  // 保存单例
  static EventBus _singleton = new EventBus._internal();

  // 通过工程持久化实现
  factory EventBus() => _singleton;

  var _emap = new Map<Object, List<EventCallback>>();

  //订阅
  void on(eventName, EventCallback callback) {
    if (eventName == null || callback == null) {
      return;
    }
    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(callback);
  }

  //取消订阅
  void off(eventName, [EventCallback callback]) { 
    if (eventName == null || _emap[eventName] == null) {
      return;
    }
    var list = _emap[eventName];
    if (callback == null) {
      _emap[eventName] = null;
    } else {
      list.remove(callback);
    }
  }

  //发射
  void emit(eventName, [callback]) {
    var list = _emap[eventName];
    if (list = null) {
      return;
    }
    int len = list.length - 1;
    for (var i = len; i > -1; i--) {
      list[i](callback);
    }
  }
}

var bus =new EventBus();