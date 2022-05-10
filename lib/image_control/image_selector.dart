import 'package:comunidadefreiriana/image_control/edit_image.dart';
import 'package:comunidadefreiriana/image_control/image_controller.dart';
import 'package:flutter/material.dart';

class ImageSelector extends StatelessWidget {
  const ImageSelector({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final ImageController? controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        controller!.editImage(index);
        Navigator.pushNamed(context, EditImageScreen.id);
      },
      // child: Text(
      //     controller!.selectedImages[index].path)
      child: Container(
        color: Colors.red,
        height: size.height * 0.3,
        width: size.width * 0.3,
        child: Stack(
          children: [
            
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Text('Editar imagem',
                      style: TextStyle(backgroundColor: Colors.white)),
                  Icon(Icons.edit)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
