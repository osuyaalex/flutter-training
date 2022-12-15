class TypesHelper{
  static int toInt(val){
    try{
        if(val == null){
          return 0;
        }
        if(val is int){
          return val;
        } else{
          return val.toInt();
        }

    }catch(error){
      print(error);
      return 0;
    }
  }

  static double todouble(val){
    try{
      if(val == null){
        return 0;
      }
      if(val is double){
        return val;
      }else{
        return val.toDouble();
      }

    }catch(error){
      return 0;
    }
  }
}