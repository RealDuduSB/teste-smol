import 'package:flutter/material.dart';

class Ingredientes {
  int morango;
  int granulado;
  int ninho;

  Ingredientes({this.morango = 0, this.granulado = 0, this.ninho = 0});
}
class PrecoIng {
  double precoMor;
  double precoGran;
  double precoNin;

  PrecoIng({this.precoMor = 1.25 , this.precoGran = 1.25, this.precoNin = 1.25});
}

class Bombom {
  double preco = 4.50;
  int quantidade = 1;
  Ingredientes ingredientes = Ingredientes();
  PrecoIng precoIng = PrecoIng();
}

class ViewHome extends StatefulWidget {
  const ViewHome({Key? key}) : super(key: key);

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

List<Bombom> listaBombons = [];

class _ViewHomeState extends State<ViewHome> {
  void adicionarIngredientes(int morango, int granulado, int ninho) {
    Bombom novoBombom = Bombom();
    novoBombom.ingredientes.morango = morango;
    novoBombom.ingredientes.granulado = granulado;
    novoBombom.ingredientes.ninho = ninho;
    bool encontrado = false;
    for (var i = 0; i < listaBombons.length; i++) {
      if (listaBombons[i].ingredientes.morango == morango &&
          listaBombons[i].ingredientes.granulado == granulado &&
          listaBombons[i].ingredientes.ninho == ninho) {
        listaBombons[i].quantidade++;
        encontrado = true;
        break;
      }
    }
    if (!encontrado) {
      listaBombons.add(novoBombom);
    }
    setState(() {});
  }

  void diminuirQuantidade(Bombom bombom) {
    if (bombom.quantidade > 1) {
      bombom.quantidade--;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Row(
            children: const [
              Icon(
                Icons.chevron_left_rounded,
                color: Colors.green,
              )
            ],
          ),
        ),
        body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    'Ingredientes:',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: <Widget>[
                      const Text('Morango: '),
                      const SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () => adicionarIngredientes(1, 0, 0),
                        child: const Text('+'),
                      ),
                      const SizedBox(width: 16.0),
                      listaBombons.isNotEmpty &&
                              listaBombons.last.ingredientes.morango == 1
                          ? ElevatedButton(
                              onPressed: () =>
                                  diminuirQuantidade(listaBombons.last),
                              child: const Text('-'),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: <Widget>[
                      const Text('Granulado: '),
                      const SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () => adicionarIngredientes(0, 1, 0),
                        child: const Text('+'),
                      ),
                      const SizedBox(width: 16.0),
                      listaBombons.isNotEmpty &&
                              listaBombons.last.ingredientes.granulado == 1
                          ? ElevatedButton(
                              onPressed: () =>
                                  diminuirQuantidade(listaBombons.last),
                              child: const Text('-'),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                ])));
  }
}
