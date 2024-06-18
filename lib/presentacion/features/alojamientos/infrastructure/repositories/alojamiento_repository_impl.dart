import 'package:app_p2sw1/presentacion/features/alojamientos/domain/datasources/alojamiento_datasource.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/domain/entities/alojamiento.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/domain/entities/formulario.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/domain/repositories/categoria_repository.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/infrastructure/datasources/alojamiento_datasource_impl.dart';

class AlojamientoRepositoryImpl extends AlojamientoRepository {
  final AlojamientoDataSource dataSource;

  AlojamientoRepositoryImpl({AlojamientoDataSource? dataSource})
      : dataSource = dataSource ?? AlojamientoDataSourceImpl();

  @override
  Future<List<Alojamiento>> getAlojamientos() async {
    return await dataSource.getAlojamientos();
  }

  @override
  Future<List<FormularioData>> getFormularioOpinion() async {
    return await dataSource.getFormularioOpinion();
  }

  @override
  Future<void> editarFormularioOpinion(FormularioData formularioData) async {
    return await dataSource.editarFormularioOpinion(formularioData);
  }

  @override
  Future<String> applicationIA(List<FormularioData> formularios,
      List<String> agenciasAlojamiento) async {
    return await dataSource.applicationIA(formularios, agenciasAlojamiento);
  }
}
