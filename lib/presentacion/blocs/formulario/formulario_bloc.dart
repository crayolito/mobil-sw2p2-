import 'package:app_p2sw1/presentacion/blocs/authentication/authentication_bloc.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/domain/entities/formulario.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/infrastructure/repositories/alojamiento_repository_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'formulario_event.dart';
part 'formulario_state.dart';

class FormularioBloc extends Bloc<FormularioEvent, FormularioState> {
  final alojamientoRepositoryImpl = AlojamientoRepositoryImpl();
  final AuthenticationBloc authenticationBloc;
  FormularioBloc({required this.authenticationBloc})
      : super(FormularioState()) {
    on<OnGetFormularios>((event, emit) async {
      print("entro aqui");
      try {
        List<FormularioData> formularios =
            await alojamientoRepositoryImpl.getFormularioOpinion();
        final idUserAuth = authenticationBloc.state.authUser!.id;

        List<String> alojamientosAux =
            formularios.map((e) => e.nombreAlojamiento).toSet().toList();

        formularios = formularios
            .where((element) => element.idUsuario == idUserAuth)
            .toList();
        // print(formularios);
        // print(alojamientosAux);
        emit(state.copyWith(
            formularios: formularios, alojamientosAux: alojamientosAux));
        print(state.formularios);
      } catch (e) {
        print(e);
      }
    });

    on<OnEditFormulario>((event, emit) async {
      final FormularioData formularioData = FormularioData(
          idFormulario: state.formularioSelect!.idFormulario,
          idUsuario: state.formularioSelect!.idUsuario,
          nombreAlojamiento: state.formularioSelect!.nombreAlojamiento,
          origen: event.origin,
          destino: event.destino,
          opinionEstadia: event.opinionEstadia,
          opinionDestino: event.opinionDestino,
          motivoViaje: event.motivoViaje,
          estado: true);
      // NOTE : CUANDO TAKESHI ARREGLE LA BASE DE DATOS
      await alojamientoRepositoryImpl.editarFormularioOpinion(formularioData);
    });

    on<OnSelectFormulario>((event, emit) {
      emit(state.copyWith(formularioSelect: event.formularioData));
    });

    on<OnApplyIA>((event, emit) async {
      // NOTE : CUANDO TAKESHI ARREGLE LA BASE DE DATOS
      final respuesta = await alojamientoRepositoryImpl.applicationIA(
          state.formularios, state.alojamientosAux);
      // final respuesta = await alojamientoRepositoryImpl.applicationIA(
      // formularios, alojamientosIA);
      emit(state.copyWith(respuestIA: respuesta));
    });
  }
}
