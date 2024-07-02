import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/categoria_field_cubit.dart';

class CategoriaInputField extends StatelessWidget {
  const CategoriaInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CustomCategoriaDropdown();
  }
}

class _CustomCategoriaDropdown extends StatefulWidget {
  const _CustomCategoriaDropdown();

  @override
  State<_CustomCategoriaDropdown> createState() =>
      _CustomCategoriaDropdownState();
}

class _CustomCategoriaDropdownState extends State<_CustomCategoriaDropdown> {
  final selectedItems = <String>[];

  @override
  Widget build(BuildContext context) {
    return _buildAutorList();
  }

  Widget _buildAutorList() {
    return DropdownSearch<String>(
      clearButtonProps: const ClearButtonProps(
        icon: Icon(Icons.close),
      ),
      asyncItems: (text) {
        return context.read<CategoriaFieldCubit>().getCategorias().then(
              (list) => list.map((e) => e.toJson()).toList(),
            );
      },
      itemAsString: (item) => CategoriaModel.fromJson(item).descricao,
      popupProps: PopupPropsMultiSelection.modalBottomSheet(
        modalBottomSheetProps: const ModalBottomSheetProps(
          padding: EdgeInsets.only(
            left: kDefaultPadding * 2,
            right: kDefaultPadding * 2,
            top: kDefaultPadding,
          ),
        ),
        showSearchBox: true,
        searchFieldProps: const TextFieldProps(
          decoration: InputDecoration(
            hintText: 'Pesquisar categoria',
            border: OutlineInputBorder(),
          ),
        ),
        containerBuilder: (context, popupWidget) => Container(
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            top: kDefaultPadding / 2,
          ),
          child: popupWidget,
        ),
        selectionWidget: (context, item, isSelected) {
          final categoria = CategoriaModel.fromJson(item);

          return Checkbox(
            value: isSelected,
            onChanged: (value) {
              context.read<CategoriaFieldCubit>().changeValue(categoria);
            },
            shape: const CircleBorder(),
          );
        },
        itemBuilder: (context, item, isSelected) {
          final author = CategoriaModel.fromJson(item);

          return ListTile(
            title: Text(author.descricao),
          );
        },
      ),
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: 'Selecionar categoria',
          border: OutlineInputBorder(),
        ),
      ),
      onChanged: (c) {
        if (c == null) {
          return;
        }

        final categoria = CategoriaModel.fromJson(c);
        context.read<CategoriaFieldCubit>().changeValue(categoria);
      },
      validator: (value) {
        if (value == null) {
          return 'Seleciona a categoria';
        }
        return null;
      },
    );
  }
}
