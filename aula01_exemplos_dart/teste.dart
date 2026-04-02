void main(){
   
  var nome = "Julio";
  int x = 10;

  var lista = [10, 90, 20, 90, 10];
  lista.add(100);
  print("oi mundo: $x, ${nome}");

  print("tam:${lista.length} elemnto 2: ${lista[1]}");

  var grupo = {10, 90, 20, 90, 10};

  print("tam:${grupo.length} ");

  var notas = { "joao":10, "mario":7};
  print(notas["joao"]!=10 && true);

}