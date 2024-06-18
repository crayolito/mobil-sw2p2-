import 'package:app_p2sw1/presentacion/features/alojamientos/domain/entities/alojamiento.dart';

class Alojamientos {
  List<Alojamiento> alojamientos;

  Alojamientos({required this.alojamientos});

  factory Alojamientos.fromJson(Map<String, dynamic> json) {
    if (json == null ||
        !json.containsKey('data') ||
        !json['data'].containsKey('findAllAccomodations')) {
      throw FormatException("JSON inválido");
    }

    var alojamientosJson = json['data']['findAllAccomodations'];
    if (alojamientosJson is! List) {
      throw FormatException(
          "JSON inválido: 'findAllAccomodations' debe ser una lista");
    }

    List<Alojamiento> alojamientosList = alojamientosJson.map((data) {
      if (data is! Map) {
        throw FormatException(
            "JSON inválido: cada alojamiento debe ser un objeto");
      }

      return Alojamiento(
        id: data["id"] ?? "",
        nombreAlojamiento: data["company"] ?? "",
        owner: data["owner"] ?? "",
        imageURL: data["imageUrl"] ?? "",
        horarioAtencion: data["schedule"] ?? "",
        nroAtencion: data["attention_number"] ?? 0,
        ubicacionCoordenadas: data["coordinates"] ?? "",
        ubicacionDescriptiva: data["description"] ?? "",
        nroEstrellas: data["stars"] ?? 0,
        descripcionServiciosGenerales: data["description_services"] ?? "",
        tiposHabitaciones: [],
        igUrl: data["instagramUrl"] ?? "",
        fbUrl: data["facebookUrl"] ?? "",
        webUrl: data["webUrl"] ?? "",
      );
    }).toList();

    return Alojamientos(alojamientos: alojamientosList);
  }
}
