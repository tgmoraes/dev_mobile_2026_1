
import './livro.dart';

main() {
  //construtor
  var got = Livro("game of thrones", 500);

  print(got.titulo);
  got.titulo = "Game of Thrones";

  print(got.titulo);

  //muitas vezes no flutter utilizaremos parâmetros nomeados quebrando linhas para cada parâmetro para facilitar a legibilidade!
  got.ler(
    paginas: 100, 
    doComeco: false
  );

  got.ler(paginas: 50);
  print(got.paginasLidas);

  got.ler(paginas:20, doComeco: true);
  //dentro de outro arquivo não consigo acessar atributos privados: da erro
  //print(got._pgLidas);
  print(got.paginasLidas);
}