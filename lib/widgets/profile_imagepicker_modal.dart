import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sincroneasy/services/image_picker_controller.dart';

profileImageModalBottonSheet(
    BuildContext context, ImagePickerController imagePickerController) {
  showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () =>
                        imagePickerController.pickImage(ImageSource.camera),
                    child: SizedBox(
                      width: 150,
                      child: Row(
                        children: const [
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
                        imagePickerController.pickImage(ImageSource.gallery),
                    child: SizedBox(
                      width: 150,
                      child: Row(
                        children: const [
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
          ));
}
