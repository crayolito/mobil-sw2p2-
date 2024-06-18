part of 'formulario_bloc.dart';

class FormularioEvent extends Equatable {
  const FormularioEvent();

  @override
  List<Object> get props => [];
}

class OnGetFormularios extends FormularioEvent {
  const OnGetFormularios();
}

// ignore: must_be_immutable
class OnEditFormulario extends FormularioEvent {
  String origin;
  String destino;
  String opinionEstadia;
  String opinionDestino;
  String motivoViaje;

  OnEditFormulario({
    required this.origin,
    required this.destino,
    required this.opinionEstadia,
    required this.opinionDestino,
    required this.motivoViaje,
  });
}

class OnSelectFormulario extends FormularioEvent {
  final FormularioData formularioData;

  const OnSelectFormulario({required this.formularioData});
}

class OnApplyIA extends FormularioEvent {
  const OnApplyIA();
}
