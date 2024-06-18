import 'package:app_p2sw1/presentacion/features/alojamientos/domain/entities/alojamiento.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/domain/entities/formulario.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/domain/entities/formularios.dart';

abstract class AlojamientoRepository {
  Future<List<Alojamiento>> getAlojamientos();
  Future<List<FormularioData>> getFormularioOpinion();
  Future<void> editarFormularioOpinion(FormularioData formularioData);
  Future<String> applicationIA(List<FormularioData> formularios, List<String> agenciasAlojamiento);
}
