import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/helpers/styles.dart';
import 'package:sincroneasy/services/image_picker_controller.dart';
import 'package:sincroneasy/widgets/custom_button_widget.dart';
import 'package:sincroneasy/widgets/custom_InkWell.dart';

import '../repositories/user_client.dart';
import '../services/auth_service.dart';
import '../widgets/profile_imagepicker_modal.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    UserClient currentUser = Provider.of<UserClient>(context);
    ImagePickerController imagePickerController =
        ImagePickerController(userUID: currentUser.getUid);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 40, child: Image.asset('assets/icons/favicon.png')),
            const SizedBox(
              width: 10,
            ),
            SizedBox(width: 120, child: Image.asset('assets/icons/slogo.png')),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipOval(
                            child: Image(
                              image: NetworkImage(currentUser.getFoto),
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Positioned(
                              bottom: -10,
                              right: -10,
                              child: ClipOval(
                                child: Container(
                                  color: Color(0xFAFAFAFA),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.camera_alt_outlined,
                                      size: 30,
                                    ),
                                    onPressed: () =>
                                        profileImageModalBottonSheet(
                                            context, imagePickerController),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: customText(
                            '${currentUser.name}  ${currentUser.getLastName}',
                            20,
                            Colors.black87,
                            FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 150,
                      child: CustomButton(
                          text: 'Prestador',
                          onPressed: () => {},
                          color: orange),
                    ),
                  ),
                  customText(
                      'O que é isso ?', 16, Colors.black87, FontWeight.normal)
                ],
              )
            ],
          ),
          Flexible(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: Colors.black87,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    customText(
                        'Configurações', 20, Colors.black, FontWeight.normal),
                    Row(
                      children: [
                        customText(
                            'Tema', 16, Colors.black87, FontWeight.normal),
                        Switch(value: true, onChanged: changeTheme()),
                      ],
                    ),
                    Row(
                      children: [
                        customText('Notificações', 16, Colors.black87,
                            FontWeight.normal),
                        Switch(value: true, onChanged: changeNotifications()),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    customInkWell(() => {}, 'Permissões', 16, FontWeight.normal,
                        Colors.black87),
                    const SizedBox(
                      height: 5,
                    ),
                    customText('Conta e Segurança', 20, Colors.black,
                        FontWeight.normal),
                    const SizedBox(
                      height: 5,
                    ),
                    customInkWell(() => {}, 'Mudar E-Mail', 16,
                        FontWeight.normal, Colors.black87),
                    const SizedBox(
                      height: 5,
                    ),
                    customInkWell(() => {}, 'Mudar Senha', 16,
                        FontWeight.normal, Colors.black87),
                    const SizedBox(
                      height: 5,
                    ),
                    customInkWell(() => {}, 'Mudar Telefone', 16,
                        FontWeight.normal, Colors.black87),
                    const SizedBox(
                      height: 5,
                    ),
                    customInkWell(() => {}, 'Verificar E-Mail', 16,
                        FontWeight.normal, Colors.black87),
                    const SizedBox(
                      height: 5,
                    ),
                    customInkWell(() => {}, 'Verificar Telefone', 16,
                        FontWeight.normal, Colors.black87),
                    customInkWell(() async {
                      await context.read<AuthService>().logout();
                    }, 'Sair', 16, FontWeight.normal, Colors.black),
                    customText('Suporte', 20, Colors.black, FontWeight.normal),
                    const SizedBox(
                      height: 5,
                    ),
                    customInkWell(() => {}, 'Ajuda', 16, FontWeight.normal,
                        Colors.black87),
                    const SizedBox(
                      height: 5,
                    ),
                    customInkWell(() => {}, 'FeedBack', 16, FontWeight.normal,
                        Colors.black87),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

changeNotifications() {}

changeTheme() {}
