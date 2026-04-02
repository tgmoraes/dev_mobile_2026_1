import 'dart:ffi';

class Livro {
  //atributos privados (com underline na frente _):
  String _tit;
  int _paginas;
  int _pgLidas = 0;

  //modo tradicional
  // Livro(String titulo, int paginas){
  //   this._titulo = titulo;
  //   this._paginas = paginas;
  // }

  //construtor no dart
  Livro(this._tit, this._paginas)

  //propriedade getter e setter (para usar basta atribuir)
  String get titulo {
    return this._tit;
  }

  set titulo(String titulo) {
    this._tit = titulo;
  }

  int get paginasLidas {
    return this._pgLidas;
  }

  void ler({required int paginas, bool doComeco = false}) {
    if (doComeco) this._pgLidas = 0;
    if (this._paginas - this._pgLidas < paginas)
      this._pgLidas = this._paginas;
    else
      this._pgLidas = this._pgLidas + paginas;
  }
}

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
  //dentro do mesmo arquivo consigo acessar os atributos privados
  print(got._pgLidas);
}
