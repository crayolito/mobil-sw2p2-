import 'package:app_p2sw1/presentacion/features/alojamientos/domain/entities/formulario.dart';

class Formularios {
  List<FormularioData> formularios;

  Formularios({required this.formularios});

  factory Formularios.fromJson(Map<String, dynamic> json) {
    var formulariosResponse = json['data']['findAllOpinionForms'] as List;
    List<FormularioData> formulariosList = formulariosResponse
        .map((data) => FormularioData(
              idFormulario: data["id"] ?? "",
              idUsuario: data["user"]["id"] ?? "",
              origen: data["origin"] ?? "",
              destino: data["destination"] ?? "",
              nombreAlojamiento: data["accommodationName"] ?? "",
              opinionEstadia: data["tripOpinion"] ?? "",
              opinionDestino: data["destinyOpinion"] ?? "",
              motivoViaje: data["reasonTrip"] ?? "",
              estado: data["state"] ?? false,
            ))
        .toList();

    return Formularios(formularios: formulariosList);
  }
}
