part of 'formulario_bloc.dart';

// ignore: must_be_immutable
class FormularioState extends Equatable {
  final List<FormularioData> formularios;
  final List<String> alojamientosAux;
  final FormularioData? formularioSelect;
  final String respuestIA;
  final String data1;
  final String data2;
  final String data3;
  final String data4;
  final String data5;

  FormularioState(
      {this.data1 = '',
      this.data2 = '',
      this.data3 = '',
      this.data4 = '',
      this.data5 = '',
      this.respuestIA = 'Esperando respuesta...',
      this.formularioSelect,
      List<FormularioData>? formularios,
      List<String>? alojamientosAux})
      : formularios = formularios ?? const [],
        alojamientosAux = alojamientosAux ?? const [];

  FormularioState copyWith({
    String? data1,
    String? data2,
    String? data3,
    String? data4,
    String? data5,
    String? respuestIA,
    FormularioData? formularioSelect,
    List<FormularioData>? formularios,
    List<String>? alojamientosAux,
  }) {
    return FormularioState(
      data1: data1 ?? this.data1,
      data2: data2 ?? this.data2,
      data3: data3 ?? this.data3,
      data4: data4 ?? this.data4,
      data5: data5 ?? this.data5,
      formularioSelect: formularioSelect ?? this.formularioSelect,
      respuestIA: respuestIA ?? this.respuestIA,
      formularios: formularios ?? this.formularios,
      alojamientosAux: alojamientosAux ?? this.alojamientosAux,
    );
  }

  @override
  List<Object?> get props => [
        data1,
        data2,
        data3,
        data4,
        data5,
        formularios,
        formularioSelect,
        alojamientosAux,
        respuestIA
      ];
}
