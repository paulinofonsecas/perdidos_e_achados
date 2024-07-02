import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';

final categorias = [
  'Hambúrgueres',
  'Sanduíches',
  'Pizzas',
  'Saladas',
  'Acompanhamentos',
  'Bebidas',
  'Sobremesas',
  'Wraps',
  'Tacos',
  'Nuggets',
];

List<CategoriaModel> categoriaList =
    List.generate(categorias.length, (i) => CategoriaModel.make(categorias[i]))
        .toList();
