import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/core/themes/ui/form/form_ui.dart';
import 'package:tomato_timer/modules/home/controller/home_cubit.dart';
import 'package:tomato_timer/modules/home/home_routing.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<HomeCubit>();
    final titleEC = TextEditingController();
    final descriptionEC = TextEditingController();
    final formKey = FormUI.generateKey;
    return TemplateUI(
      appBar: AppBar(),
      body: FormUI(
        formKey: formKey,
        child: Column(
          children: [
            TypographyUI('Notas')..h2Bold,
            TextFieldUI(
              name: 'title',
              label: 'Título',
              hintText: 'Insira o título',
              controller: titleEC,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'É necessário adicionar um título';
                } else if (p0.length <= 2) {
                  return 'O título deve ser menor que duas letras';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldUI(
              name: 'body',
              label: 'Descrição',
              hintText: 'Insira o texto',
              controller: descriptionEC,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'É necessário adicionar uma descrição';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      fixedBottomWidget: Padding(
        padding: const EdgeInsets.all(24),
        child: ButtonUI(
          'Salvar',
          onPressed: () {
            if (!formKey.currentState!.saveAndValidate()) {
              return;
            }
            cubit.saveNotes(
              title: titleEC.text,
              description: descriptionEC.text,
            );
            Modular.to.pushNamedAndRemoveUntil(
              HomeRouting.homePage,
              ModalRoute.withName(HomeRouting.homePage),
            );
          },
        )..solid,
      ),
    );
  }
}
