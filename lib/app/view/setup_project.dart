import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';
import 'package:gestao_restaurante/dados/servicos/categoria_firebase.dart';

Future<void> setUpProject() async {
  final categorias = [
    CategoriaModel.make('Fast foods'),
    CategoriaModel.make('Doces'),
    CategoriaModel.make('Gelados'),
    CategoriaModel.make('Refrigerantes'),
    CategoriaModel.make('Bebidas'),
  ];

  for (final categoria in categorias) {
    await CategoriaFirebase().addCategoria(categoria);
  }
}
