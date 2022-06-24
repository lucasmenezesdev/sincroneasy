import 'dart:io';
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/helpers/styles.dart';
import 'package:sincroneasy/services/firebase_storage.dart';
import 'package:sincroneasy/services/firestore_db.dart';
import 'package:sincroneasy/services/user_data_controller.dart';
import 'package:sincroneasy/widgets/custom_button_widget.dart';
import 'package:sincroneasy/widgets/modal_bottom_config.dart';

import '../repositories/user_client.dart';
import '../services/auth_service.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    UserClient currentUser = Provider.of<UserClient>(context);
    File? pickedImage;
    UserDataController userController = UserDataController(context: context);

    FirebaseStorage storageRef = FirebaseStg.get();

    Future pickImage(ImageSource source) async {
      try {
        final pickedImage = await ImagePicker().pickImage(source: source);
        if (pickedImage == null) return;
        final tempImage = File(pickedImage.path);
        try {
          await storageRef
              .ref(
                  'users/consumers/${currentUser.getUid}/profile/${tempImage.toString()}')
              .putFile(tempImage);
          final imageURL = await storageRef
              .ref(
                  'users/consumers/${currentUser.getUid}/profile/${tempImage.toString()}')
              .getDownloadURL();
          userController.postProfileImage(imageURL);
        } on FirebaseException catch (e) {
          print(e.message);
        }
      } on PlatformException catch (e) {
        print(e.message);
      }
    }

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
        actions: [
          InkWell(
            onHover: (value) {
              setState(() {
                value ? _isHovering = true : _isHovering = false;
              });
            },
            hoverColor: Colors.transparent,
            onTap: () {
              modal_bottom_config(context);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(
                  height: 12,
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                      child: Container(color: Colors.black.withOpacity(0)),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: NetworkImage(currentUser.getFoto),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  child: Center(
                      child: InkWell(
                    onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          pickImage(ImageSource.camera),
                                      child: SizedBox(
                                        width: 150,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.camera_alt,
                                              size: 50,
                                            ),
                                            Text(
                                              'Câmera',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () =>
                                          pickImage(ImageSource.gallery),
                                      child: SizedBox(
                                        width: 150,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.image_search,
                                              size: 50,
                                            ),
                                            Text(
                                              'Galeria',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                            )),
                    child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            const BoxShadow(
                                color: Colors.white, spreadRadius: 4),
                          ],
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(currentUser.getFoto)),
                        )),
                  )),
                ),
              ],
            ),
            flex: 5,
          ),
          const Spacer(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: customText(
                  '${currentUser.getName} ${currentUser.getLastName}',
                  22,
                  Colors.black87,
                  FontWeight.w500),
            ),
            flex: 2,
          ),
          const Spacer(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: orange,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Faça upgrade de sua conta de cliente e seja um prestador de serviços Sincroneasy, garanta já seu plano com 3 meses gratuitos!',
                        style: TextStyle(
                            color: blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CustomButton(
                      text: 'VER PLANOS',
                      onPressed: () {},
                      color: blue,
                    )
                  ],
                ),
              ),
            ),
            flex: 7,
          )
        ],
      ),
    );
  }
}
