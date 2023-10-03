class TypeCast {
  static int? toInt(dynamic value) {
    int? _value = 0;
    switch (value?.runtimeType) {
      case String:
        {
          _value = int.tryParse(value);
          break;
        }
      case int:
        {
          _value = value;
          break;
        }
      case double:
        {
          _value = int.tryParse(value.toString());
        }
    }
    return _value;
  }

  static double? toDouble(dynamic value) {
    double? _value = 0.0;
    switch (value?.runtimeType) {
      case String:
        {
          _value = double.tryParse(value);
          break;
        }
      case double:
        {
          _value = value;
          break;
        }
      case int:
        {
          _value = double.tryParse(value.toString());
        }
    }
    return _value;
  }

  static String toSafeString(dynamic value) {
    return value?.toString() ?? "";
  }

  static List<String> toListString(dynamic value) {
    List<String> _value = [];
    switch (value?.runtimeType) {
      case String:
        {
          _value = [value];
          break;
        }
      case int:
        {
          _value = [value];
          break;
        }
      case double:
        {
          _value = [value];
          break;
        }
      case List:
        {
          _value = (value as List).map((item) {
            return toSafeString(item);
          }).toList();
        }
    }
    return _value;
  }


  static DateTime? toDateTime(dynamic value) {
    DateTime? _value;
    if(value != null){
      _value = DateTime.tryParse(value);
    }
    return _value;
  }


}