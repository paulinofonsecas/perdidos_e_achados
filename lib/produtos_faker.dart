import 'dart:math';

import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/dados/servicos/categoria_firebase.dart';
import 'package:gestao_restaurante/dados/servicos/produto_firebase.dart';
import 'package:uuid/uuid.dart';

final items = [
  {
    'nome': 'Carteira de bolso',
    'descricao': 'Carteira de cor preta com detalhes em azul',
    'localEncontrado': 'Rua Almirante Pedro',
  },
  {
    'nome': 'Celular',
    'descricao': 'Celular Samsung com capinha vermelha',
    'localEncontrado': 'Avenida Brasil',
  },
  {
    'nome': 'Chaveiro',
    'descricao': 'Chaveiro com chave de carro e chave de casa',
    'localEncontrado': 'Praça das Flores',
  },
  {
    'nome': 'Óculos de sol',
    'descricao': 'Óculos de sol Ray-Ban com armação preta',
    'localEncontrado': 'Rua das Palmeiras',
  },
  {
    'nome': 'Relógio',
    'descricao': 'Relógio Casio com pulseira de couro marrom',
    'localEncontrado': 'Estação Central',
  },
  {
    'nome': 'Mochila',
    'descricao': 'Mochila azul com detalhes em preto',
    'localEncontrado': 'Parque da Cidade',
  },
  {
    'nome': 'Livro',
    'descricao': "Livro 'O Alquimista' de Paulo Coelho",
    'localEncontrado': 'Biblioteca Municipal',
  },
  {
    'nome': 'Guarda-chuva',
    'descricao': 'Guarda-chuva preto com cabo de madeira',
    'localEncontrado': 'Shopping Center',
  },
  {
    'nome': 'Boné',
    'descricao': 'Boné vermelho com logo da Nike',
    'localEncontrado': 'Estádio de Futebol',
  },
  {
    'nome': 'Carteira de motorista',
    'descricao': 'Carteira de motorista em nome de João Silva',
    'localEncontrado': 'Rua das Laranjeiras',
  },
  {
    'nome': 'Pulseira',
    'descricao': 'Pulseira de prata com pingente de coração',
    'localEncontrado': 'Rua das Acácias',
  },
  {
    'nome': 'Fone de ouvido',
    'descricao': 'Fone de ouvido Bluetooth preto',
    'localEncontrado': 'Terminal Rodoviário',
  },
  {
    'nome': 'Câmera fotográfica',
    'descricao': 'Câmera Canon EOS 80D',
    'localEncontrado': 'Mirante do Pôr do Sol',
  },
  {
    'nome': 'Carteira de identidade',
    'descricao': 'Carteira de identidade em nome de Maria Souza',
    'localEncontrado': 'Rua dos Ipês',
  },
  {
    'nome': 'Tablet',
    'descricao': 'Tablet iPad com capa azul',
    'localEncontrado': 'Café Central',
  }
];

final refrigerantes = {
  {
    'nome': 'Refrigerante de Cola',
    'descricao': '',
  },
  {
    'nome': 'Milkshake de Chocolate',
    'descricao': '',
  },
  {
    'nome': 'Suco de Laranja',
    'descricao': '',
  },
  {
    'nome': 'Água Mineral',
    'descricao': '',
  },
  {
    'nome': 'Chá Gelado de Limão',
    'descricao': '',
  },
  {
    'nome': 'Smoothie de Morango',
    'descricao': '',
  },
  {
    'nome': 'Café Gelado',
    'descricao': '',
  },
};

List<ItemModel> _generateProdutos(List<CategoriaModel> categorias) {
  final produtosList = items
      .map(
        (refri) => ItemModel(
          id: const Uuid().v4(),
          nome: refri['nome']!,
          descricao: refri['descricao']!,
          localEncontrado: refri['localEncontrado'],
          encontrado: Random.secure().nextBool(),
          categoria: categorias[Random.secure().nextInt(categorias.length)],
          criationDate: DateTime.now(),
          dataItemAchado: DateTime.now()
              .subtract(Duration(days: Random.secure().nextInt(10 * 365)))
              .add(Duration(days: Random.secure().nextInt(10 * 365))),
          dataItemPerdido: DateTime.now()
              .subtract(Duration(days: Random.secure().nextInt(10 * 365)))
              .add(Duration(days: Random.secure().nextInt(10 * 365))),
          userQuerAchou: 'Fulano',
          imagemUrl: [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQkSMXJ2C4NOA-q3Y55Thgt2a1A5fiqTeAsA&s',
            'https://m.media-amazon.com/images/I/61fJ2wk8EIL._AC_UF894,1000_QL80_.jpg',
            'https://carrefourbr.vtexassets.com/arquivos/ids/7314953/MV22817904_Carteira-Masculina-de-Bolso_2_Zoom.jpg?v=637349300369700000',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZEPykLUX-IaLwugogQBl3hDkPm5FN_ZMcSw&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbDXWRYDhzbW_y8Dz2XUka7x4B62ztuuysMw&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzWUsLWsBcH0fX4gd1zSaLoV43oeA2L9vCKQ&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoZtflESo61r8F73UXvVt6hJT1jc_b9bGM3g&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4KqogTvyqSgQWdtNpgcYaU-OFM88XPbHAow&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy6nj9ENjN5zqxJSYZT-Smy6fa88ZumvP9Ug&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV67_NrXncqNU8rBiKOEvxZfv7eprmOKzOvw&s',
          ],
        ),
      )
      .toList();

  return produtosList;
}

Future<void> populateProducts() async {
  final categorias = await cloudCategorias();

  final prods = _generateProdutos(categorias);
  final pf = ItemFirebase.instance;

  for (final produto in prods) {
    await pf.addItem(produto);
  }
}

Future<List<CategoriaModel>> cloudCategorias() async {
  final cf = CategoriaFirebase();
  return cf.getCategorias();
}
