import 'dart:async';

import 'package:app_p2sw1/presentacion/features/alojamientos/domain/datasources/alojamiento_datasource.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/domain/entities/alojamiento.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/domain/entities/alojamientos.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/domain/entities/formulario.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/domain/entities/formularios.dart';
import 'package:dio/dio.dart';

class AlojamientoDataSourceImpl extends AlojamientoDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://springbootgraphqlsw2-production.up.railway.app/graphql',
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  @override
  Future<List<Alojamiento>> getAlojamientos() async {
    var data = {
      "query": """
      query {
        findAllAccomodations {
          id
          company
          owner
          imageUrl
          schedule
          attention_number
          coordinates
          description
          stars
          description_services
          typeRoom
          instagramUrl
          facebookUrl
          webUrl
        }
      }
    """,
      "variables": {}
    };

    try {
      var response = await dio.request(
        '',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );
      // return alojamientosDataAuxliar;
      if (response.statusCode == 200) {
        final structureData = Alojamientos.fromJson(response.data);
        return structureData.alojamientos;
      } else {
        throw Exception('No fue una respuesta 200 Alojamientos');
      }
    } catch (e) {
      throw Exception(
        'Error al obtener los datos Alojamientos $e',
      );
    }
  }

  @override
  Future<List<FormularioData>> getFormularioOpinion() async {
    var data = {
      "query": """
      query MyQuery {
        findAllOpinionForms {
          origin
          destination
          accommodationName
          tripOpinion
          destinyOpinion
          reasonTrip
          state
          id
          user {
            email
            id
            name
            password
          }
        }
      }
    """,
      "variables": {}
    };

    try {
      var response = await dio.request(
        '',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );
      // return alojamientosDataAuxliar;
      if (response.statusCode == 200) {
        final structureData = Formularios.fromJson(response.data);
        return structureData.formularios;
      } else {
        throw Exception('No fue una respuesta 200 Formularios');
      }
    } catch (e) {
      throw Exception(
        'Error al obtener los datos Formularios $e',
      );
    }
  }

  @override
  Future<void> editarFormularioOpinion(FormularioData formularioData) async {
    var data = {
      "query": '''
      mutation {
        updateOpinionForm(inputOpinionForm: {
          origin: "${formularioData.origen}"
          destination : "${formularioData.destino}",
          accommodationName : "${formularioData.nombreAlojamiento}",
          tripOpinion : "${formularioData.opinionEstadia}",
          destinyOpinion :"${formularioData.opinionDestino}",
          reasonTrip : "${formularioData.motivoViaje}",
          state : ${formularioData.estado}
        }, 
        opinionFormId: "${formularioData.idFormulario}") {
          origin
        }
      }
    ''',
      "variables": {}
    };

    try {
      var response = await dio.request(
        '',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );
      if (response.statusCode == 200) {
        print("Formulario editado");
      } else {
        throw Exception('No fue una respuesta 200 Edit Formulario');
      }
    } catch (e) {
      throw Exception(
        'Error al editar los datos del Formulario $e',
      );
    }
  }

  @override
  Future<String> applicationIA(List<FormularioData> formularios,
      List<String> agenciasAlojamiento) async {
    var dio = Dio();

    final data = {
      "model": "claude-3-opus-20240229",
      "max_tokens": 1024,
      "messages": [
        {
          "role": "user",
          "content": """
        Escriba un plan de viaje en cualquier lugar de Peru o Bolivia sencillo corto y directo cumpliendo si o si el formato
        PLAN SUGERIDO
        * DONDE IR  
        - (Pais y Provincia )
        * MOTIVOS PARA IR
        - (solo 3)
        * EPOCA DEL AÑO ADECUADA 
        - (fecha inicio y fin)
        * ALOJAMIENTO RECOMENDANDOS 
        - (minimo 3 alojamiento solamente el nombre del alojamiento y usa si o si la lista de alojamientoSugerencia ) 
        * PRESUPUESTO APROXIMADO
        -(solo la cantidad en dolares)

        quiero esa informacion, pero basado en los siguientes datos :
        formulariosOpiniones : ${formularios.toString()}
        alojamientoSugerencia : ${agenciasAlojamiento.toString()}
      """
        }
      ]
    };

    try {
      var response = await dio.post(
        'https://api.anthropic.com/v1/messages',
        data: data,
        options: Options(
          headers: {
            'x-api-key': '',
            'anthropic-version': '2023-06-01',
            'content-type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        String respuestaIA = response.data['content'][0]['text'];
        return respuestaIA;
      } else {
        throw Exception('No fue una respuesta 200');
      }
    } catch (e) {
      throw Exception('Error al enviar el mensaje: $e');
    }
  }
}
