import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';

final categorias = [
  'Eletrônicos',
  'Acessórios',
  'Documentos',
  'Roupas',
  'Bolsas e Mochilas',
  'Joias',
  'Chaves',
  'Equipamentos Esportivos',
  'Brinquedos',
  'Livros e Papelaria',
];

List<CategoriaModel> categoriaList =
    List.generate(categorias.length, (i) => CategoriaModel.make(categorias[i]))
        .toList();
