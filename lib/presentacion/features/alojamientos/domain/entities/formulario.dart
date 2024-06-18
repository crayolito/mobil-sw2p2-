class FormularioData {
  String idFormulario;
  String idUsuario;
  String nombreAlojamiento;
  String origen;
  String destino;
  String opinionEstadia;
  String opinionDestino;
  String motivoViaje;
  bool estado;

  FormularioData(
      {required this.idFormulario,
      required this.idUsuario,
      required this.nombreAlojamiento,
      required this.origen,
      required this.destino,
      required this.opinionEstadia,
      required this.opinionDestino,
      required this.motivoViaje,
      required this.estado});
}

List<FormularioData> formularios = [
  FormularioData(
      idFormulario: "001",
      idUsuario: "1001",
      nombreAlojamiento: "Hotel Monasterio",
      origen: "Lima, Perú",
      destino: "Cusco, Perú",
      opinionEstadia: "Excelente servicio y ambiente acogedor.",
      opinionDestino: "Cusco es una ciudad histórica impresionante.",
      motivoViaje: "Turismo",
      estado: true),
  FormularioData(
      idFormulario: "002",
      idUsuario: "1002",
      nombreAlojamiento: "Belmond Hotel Rio Sagrado",
      origen: "La Paz, Bolivia",
      destino: "Urubamba, Perú",
      opinionEstadia:
          "La vista al río es espectacular y el personal muy amable.",
      opinionDestino: "Urubamba es un lugar tranquilo y hermoso.",
      motivoViaje: "Vacaciones",
      estado: true),
  FormularioData(
      idFormulario: "003",
      idUsuario: "1003",
      nombreAlojamiento: "Hotel Rosario",
      origen: "Santa Cruz, Bolivia",
      destino: "La Paz, Bolivia",
      opinionEstadia:
          "Muy cómodo y céntrico, perfecto para explorar la ciudad.",
      opinionDestino: "La Paz tiene una cultura y una energía únicas.",
      motivoViaje: "Trabajo",
      estado: true),
  FormularioData(
      idFormulario: "004",
      idUsuario: "1004",
      nombreAlojamiento: "Casa Andina Premium",
      origen: "Cusco, Perú",
      destino: "Arequipa, Perú",
      opinionEstadia:
          "El hotel tiene un encanto colonial y un excelente servicio.",
      opinionDestino: "Arequipa es conocida como la Ciudad Blanca, hermosa.",
      motivoViaje: "Visita familiar",
      estado: true),
  FormularioData(
      idFormulario: "005",
      idUsuario: "1005",
      nombreAlojamiento: "Casa Grande Hotel",
      origen: "Sucre, Bolivia",
      destino: "La Paz, Bolivia",
      opinionEstadia: "Instalaciones modernas y excelente comida.",
      opinionDestino: "La Paz es una ciudad fascinante con mucho que ofrecer.",
      motivoViaje: "Conferencia",
      estado: true),
];
