import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/imagem_field_cubit.dart';

class ImagemInputField extends StatelessWidget {
  const ImagemInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FormBuilderImagePicker(
          name: 'Fotos',
          maxImages: 5,
          previewMargin: const EdgeInsets.all(10),
          decoration: const InputDecoration(
            labelText: 'Selecione as fotos do produto',
          ),
          onChanged: (value) {
            if (value == null) return;

            // ignore: avoid_dynamic_calls
            final paths = value.map((e) => e.path).toList();
            context.read<ImagemFieldCubit>().onChanged(paths);
          },
        ),
      ],
    );
  }
}
