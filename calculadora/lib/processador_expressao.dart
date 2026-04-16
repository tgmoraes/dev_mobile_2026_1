enum Estado{
  inicio,
  lendoOperador1,
  lendoOperador2,
  operacao,
}
class ProcessadorExpressao{
  String _num1 = "";
  String _num2 = "";
  String _operador = "";
  Estado _estado = Estado.inicio;

  String processaChar(String valor){
    switch(valor){
      case "CE":
        _num1 = "0";
        _num2 = "";
        _operador = "";
        _estado = Estado.inicio;
        break;
      case "1" || "2" || "3" || "4" || "5" || "6" || "7" || "8" || "9" || "0":
        if(_estado == Estado.inicio || _estado == Estado.lendoOperador1){
           _num1 = int.parse(_num1 + valor).toString();

          _estado = Estado.lendoOperador1;
        }else if(_estado == Estado.operacao || _estado == Estado.lendoOperador2){
          _num2 = int.parse(_num2 + valor).toString();
          _estado = Estado.lendoOperador2;
        }
        break;
      case "+" || "-" || "*" || "/":
        if(valor=="-" && _estado == Estado.inicio){
          _num1 = "-";
          _estado = Estado.lendoOperador1;
        }else if(valor=="-" && _estado == Estado.operacao){
            _num2 = "-";
          _estado = Estado.lendoOperador2;
        }else if(_estado == Estado.lendoOperador1){
          _operador = valor;
          _estado = Estado.operacao;
        }else{
          _calcula();
        }
        break;
      case "=":
        if(_estado == Estado.lendoOperador2){
          _calcula();
        }
        break;
    }
    return _num1 + _operador + _num2 ;
  }
  
  void _calcula() {
    var num1 = int.parse(_num1);
    var num2 = int.parse(_num2);
    int res = 0;
    switch(_operador) {
      case "+":
        res = num1 + num2;
        break;
      case "-":
        res = num1 - num2;
        break;
      case "*":
        res = num1 * num2;
        break;
      case "/":
        res = num1 ~/ num2;
        break;
    }
    _num1 = res.toString();
    _num2 = "";
    _operador = "";
    _estado = Estado.lendoOperador1;
  }
}