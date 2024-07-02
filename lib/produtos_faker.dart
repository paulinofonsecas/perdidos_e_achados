import 'dart:math';

import 'package:gestao_restaurante/categorias_faker.dart';
import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';
import 'package:gestao_restaurante/dados/entidades/produto_model.dart';
import 'package:gestao_restaurante/dados/servicos/categoria_firebase.dart';
import 'package:gestao_restaurante/dados/servicos/produto_firebase.dart';

final produtos = [
  {
    'nome': 'Cheeseburger Clássico',
    'descricao':
        'Um hambúrguer suculento com carne grelhada, coberto com queijo derretido, alface, tomate, picles e cebola, tudo dentro de um pão macio. Perfeito para satisfazer qualquer desejo.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Batata Frita Crocante',
    'descricao':
        'Deliciosas batatas cortadas finas, fritas até ficarem douradas e crocantes. Servidas quentinhas, são o acompanhamento perfeito para qualquer prato principal.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Chicken Nuggets',
    'descricao':
        'Pequenos pedaços de frango empanados e fritos até ficarem dourados. Crocantes por fora e suculentos por dentro, ideais para petiscar ou mergulhar em molhos.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Pizza de Pepperoni',
    'descricao':
        'Massa fina e crocante coberta com molho de tomate, queijo mozzarella derretido e generosas fatias de pepperoni. Uma combinação clássica e irresistível.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Hot Dog Tradicional',
    'descricao':
        'Salsicha grelhada servida em um pão macio, coberta com mostarda e ketchup. Simples e saboroso, um lanche rápido e clássico para qualquer hora.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Tacos de Carne',
    'descricao':
        'Tortilhas de milho recheadas com carne temperada, alface, queijo e pico de gallo. Uma explosão de sabores e texturas em cada mordida.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Sanduíche de Frango Grelhado',
    'descricao':
        'Peito de frango grelhado, suculento e temperado, servido em um pão integral com alface, tomate e um toque de maionese.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Hambúrguer de Bacon',
    'descricao':
        'Hambúrguer suculento coberto com fatias crocantes de bacon, queijo derretido, alface e tomate. Uma combinação clássica para os amantes de sabores intensos.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Burrito de Carne e Queijo',
    'descricao':
        'Tortilha recheada com carne suculenta, feijão, queijo derretido e arroz, tudo bem temperado. Um prato completo e cheio de sabor.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Wrap de Frango com Alface',
    'descricao':
        'Tortilha macia recheada com frango grelhado, alface crocante, tomate e um molho cremoso. Leve e saboroso, perfeito para uma refeição rápida.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Onion Rings',
    'descricao':
        'Anéis de cebola empanados e fritos até ficarem dourados e crocantes. Ideais como acompanhamento ou petisco, são sempre um sucesso.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Salada Caesar com Frango',
    'descricao':
        'Alface crocante, pedaços de frango grelhado, croutons e queijo parmesão, tudo temperado com molho Caesar. Refrescante e nutritiva.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Quesadilla de Queijo',
    'descricao':
        'Tortilhas recheadas com queijo derretido e grelhadas até ficarem douradas. Simples e deliciosa, perfeita como entrada ou lanche.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Hambúrguer Vegetariano',
    'descricao':
        'Hambúrguer feito de vegetais e grãos, grelhado e servido com alface, tomate e molho especial. Uma opção saudável e saborosa.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Mini Pizzas de Calabresa',
    'descricao':
        'Pequenas pizzas com massa fina, cobertas com molho de tomate, queijo e fatias de calabresa. Perfeitas como aperitivo ou lanche.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Nachos com Guacamole',
    'descricao':
        'Tortilhas de milho crocantes cobertas com guacamole cremoso, pico de gallo e queijo derretido. Uma combinação perfeita de sabores mexicanos.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Fish and Chips',
    'descricao':
        'Filé de peixe empanado e frito até ficar crocante, servido com batatas fritas. Um clássico britânico que agrada a todos os paladares.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Burrito de Feijão',
    'descricao':
        'Tortilha recheada com feijão temperado, arroz, queijo e vegetais frescos. Uma opção vegetariana e saborosa, perfeita para uma refeição completa.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Sanduíche de Presunto e Queijo',
    'descricao':
        'Fatias de presunto e queijo, servidas em um pão fresco com alface e tomate. Simples e saboroso, ideal para um lanche rápido.',
    'preco': Random.secure().nextInt(6000),
  },
  {
    'nome': 'Pão de Alho com Queijo',
    'descricao':
        'Pão crocante coberto com manteiga de alho e queijo derretido. Perfeito como entrada ou acompanhamento de qualquer refeição.',
    'preco': Random.secure().nextInt(6000),
  },
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

List<ProdutoModel> _generateProdutos(List<CategoriaModel> categorias) {
  final produtosList = produtos
      .map(
        (refri) => ProdutoModel.make(
          nome: refri['nome']! as String,
          descricao: refri['descricao']! as String,
          preco: (refri['preco']! as int).toDouble(),
          imagemUrl: [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoPhgVJ_EdConWcowWxq3cZ9_3MxZMpxcn6A&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeSJPz3XVGSzvDc5MB81h-tpOgc0Okk24QMw&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfeeazugzVRRy-xKO1nZpzhfxrEk9mHH0xXA&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShlZSQQLHhRIoluEtg0u8GZ7--xdEx0GX9NA&s',
          ],
          categoria: categorias[Random.secure().nextInt(categorias.length)],
          disponibilidade: Random.secure().nextBool(),
        ),
      )
      .toList();

  return produtosList;
}

Future<void> populateProducts() async {
  final categorias = categoriaList;

  await populateCategorias();

  final prods = _generateProdutos(categorias);
  final pf = ProdutoFirebase.instance;
  for (final produto in prods) {
    await pf.addProduto(produto);
  }
}

Future<void> populateCategorias() async {
  final categorias = categoriaList;

  // salva as categorias no banco de dados
  final cf = CategoriaFirebase();
  for (final categoria in categorias) {
    await cf.addCategoria(categoria);
  }
}
