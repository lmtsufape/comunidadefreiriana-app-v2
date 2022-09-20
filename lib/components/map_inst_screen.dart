import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:flutter/material.dart';
import '../screens/mapa/maps_repository.dart';
import 'map_info_subtitle.dart';
import 'map_info_title.dart';
import 'vertical_spacer_box.dart';

class MapInstScreen extends StatelessWidget {
  final InstituicaoModel model;
  const MapInstScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MapsRepository().getImageInstitution(model.id),
      builder: (context, snapshot) {
        Map<dynamic, dynamic>? imageData;
        if (snapshot.hasData) {
          imageData = snapshot.data as Map<dynamic, dynamic>;
          //log('Image data is $imageData');

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
            child: SingleChildScrollView(
                child: Wrap(children: [
              Image.network('http://185.28.23.76:8010/storage/${imageData['path']}'),
              Center(
                child: Text(
                  model.nome.toString(),
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Text(
                  '(${model.categoria})',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const VerticalSpacerBox(size: SpacerSize.large),
              const MapInfoTitle(title: 'Telefone'),
              MapInfoSubtitle(subtitle: model.telefone),
              const MapInfoTitle(title: 'E-mail'),
              MapInfoSubtitle(subtitle: model.email),
              const MapInfoTitle(title: 'Site'),
              MapInfoSubtitle(subtitle: model.site),
              const MapInfoTitle(title: 'Mais Informações'),
              MapInfoSubtitle(subtitle: model.info),
              Row(
                children: [
                  OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(140, 30),
                        alignment: const AlignmentDirectional(-1, 0),
                        backgroundColor: Colors.blue,
                      ),
                      label: const Text(
                        'Outras info',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ), // <-- Text

                      icon: const Icon(
                        // <-- Icon
                        Icons.arrow_forward_ios,
                        size: 15.0,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
                                      child: Wrap(children: [
                                        Image.network('http://185.28.23.76:8010/storage/${imageData!['path']}'),
                                        Center(
                                          child: Text(
                                            model.nome.toString(),
                                            style: const TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            '(${model.categoria})',
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const MapInfoTitle(title: 'Pais'),
                                        MapInfoSubtitle(subtitle: model.pais),
                                        const MapInfoTitle(title: 'Estado'),
                                        MapInfoSubtitle(subtitle: model.estado),
                                        const MapInfoTitle(title: 'Cidade'),
                                        MapInfoSubtitle(subtitle: model.cidade),
                                        const MapInfoTitle(title: 'Endereço'),
                                        MapInfoSubtitle(subtitle: model.endereco),
                                        const MapInfoTitle(title: 'CEP'),
                                        MapInfoSubtitle(subtitle: model.cep),
                                        const MapInfoTitle(title: 'Telefone'),
                                        MapInfoSubtitle(subtitle: model.telefone),
                                        const MapInfoTitle(title: 'E-Mail'),
                                        MapInfoSubtitle(subtitle: model.email),
                                        const MapInfoTitle(title: 'Site'),
                                        MapInfoSubtitle(subtitle: model.site),
                                        const MapInfoTitle(title: 'Corrdenador(a)'),
                                        MapInfoSubtitle(subtitle: model.coordenador),
                                        const MapInfoTitle(title: 'Data de Fundação'),
                                        MapInfoSubtitle(subtitle: '${model.datafundacao!.day}/${model.datafundacao!.month}/${model.datafundacao!.year}'),
                                        const MapInfoTitle(title: 'Latitude'),
                                        MapInfoSubtitle(subtitle: model.latitude),
                                        const MapInfoTitle(title: 'Longitude'),
                                        MapInfoSubtitle(subtitle: model.longitude),
                                        const MapInfoTitle(title: 'Mais Informações'),
                                        MapInfoSubtitle(subtitle: model.info),
                                      ])),
                                ),
                              );
                            });
                      })
                ],
              ),
            ])),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
