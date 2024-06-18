import 'package:app_p2sw1/presentacion/features/alojamientos/presentation/screens/list-state-form-screen.dart';

const mapTheme = [
  {
    "featureType": "all",
    "elementType": "all",
    "stylers": [
      {"hue": "#00ffbc"}
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#3f6464"}
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#3f6464"}
    ]
  },
  {
    "featureType": "administrative.province",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#3f6464"}
    ]
  },
  {
    "featureType": "administrative.neighborhood",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#3f6464"}
    ]
  },
  {
    "featureType": "landscape",
    "elementType": "all",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "poi",
    "elementType": "all",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "all",
    "stylers": [
      {"saturation": -70}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#60adad"}
    ]
  },
  {
    "featureType": "transit",
    "elementType": "all",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "all",
    "stylers": [
      {"visibility": "simplified"},
      {"saturation": -60},
      {"color": "#60adad"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#89d1d1"}
    ]
  }
];

List<FormularioOpinion> formulariosOpiniones = [
  FormularioOpinion(
    titulo: 'Esperamos Opinión',
    estado: false,
    lugarOrigen: '',
    lugarDestino: '',
    nombreAlojamiento: 'Hotel Presidente',
    opinionAlojamiento: '',
    opionLugarDestino: '',
    motivoViaje: '',
  ),
  FormularioOpinion(
    titulo: 'Gracias por Responder',
    estado: true,
    lugarOrigen: 'Lima, Perú',
    lugarDestino: 'Cusco, Perú',
    nombreAlojamiento: 'Belmond Hotel Monasterio',
    opinionAlojamiento:
        'Excelente ubicación, muy buen servicio y desayuno delicioso.',
    opionLugarDestino: 'Cusco es mágico, lleno de historia y cultura.',
    motivoViaje: 'Turismo',
  ),
  FormularioOpinion(
    titulo: 'Esperamos Opinión',
    estado: false,
    lugarOrigen: '',
    lugarDestino: '',
    nombreAlojamiento: 'Gran Hotel Cochabamba',
    opinionAlojamiento: '',
    opionLugarDestino: '',
    motivoViaje: '',
  ),
  FormularioOpinion(
    titulo: 'Gracias por Responder',
    estado: true,
    lugarOrigen: 'La Paz, Bolivia',
    lugarDestino: 'Santa Cruz, Bolivia',
    nombreAlojamiento: 'Hotel Camino Real',
    opinionAlojamiento:
        'Hotel excelente con todas las comodidades necesarias para un viaje de negocios.',
    opionLugarDestino:
        'Santa Cruz es una ciudad en pleno crecimiento, con muchas oportunidades de negocio.',
    motivoViaje: 'Negocios',
  ),
  FormularioOpinion(
    titulo: 'Esperamos Opinión',
    estado: false,
    lugarOrigen: '',
    lugarDestino: '',
    nombreAlojamiento: 'Hotel Los Tajibos',
    opinionAlojamiento: '',
    opionLugarDestino: '',
    motivoViaje: '',
  ),
  FormularioOpinion(
    titulo: 'Gracias por Responder',
    estado: true,
    lugarOrigen: 'Arequipa, Perú',
    lugarDestino: 'Lima, Perú',
    nombreAlojamiento: 'Casa Andina Premium Miraflores',
    opinionAlojamiento: 'Muy buen hotel en una zona céntrica y segura.',
    opionLugarDestino:
        'Lima es una ciudad muy interesante con mucha oferta cultural y gastronómica.',
    motivoViaje: 'Negocios',
  ),
  FormularioOpinion(
    titulo: 'Esperamos Opinión',
    estado: false,
    lugarOrigen: '',
    lugarDestino: '',
    nombreAlojamiento: 'Hotel Rosario del Lago',
    opinionAlojamiento: '',
    opionLugarDestino: '',
    motivoViaje: '',
  ),
  FormularioOpinion(
    titulo: 'Gracias por Responder',
    estado: true,
    lugarOrigen: 'Cusco, Perú',
    lugarDestino: 'Aguas Calientes, Perú',
    nombreAlojamiento: 'Inkaterra Machu Picchu Pueblo Hotel',
    opinionAlojamiento:
        'Lugar encantador, rodeado de naturaleza y tranquilidad.',
    opionLugarDestino: 'Machu Picchu es impresionante, una experiencia única.',
    motivoViaje: 'Turismo',
  ),
  FormularioOpinion(
    titulo: 'Esperamos Opinión',
    estado: false,
    lugarOrigen: '',
    lugarDestino: '',
    nombreAlojamiento: 'Tierra Viva Puno Plaza',
    opinionAlojamiento: '',
    opionLugarDestino: '',
    motivoViaje: '',
  ),
  FormularioOpinion(
    titulo: 'Gracias por Responder',
    estado: true,
    lugarOrigen: 'Potosí, Bolivia',
    lugarDestino: 'Sucre, Bolivia',
    nombreAlojamiento: 'Parador Santa María La Real',
    opinionAlojamiento: 'Hotel con mucho encanto e historia.',
    opionLugarDestino:
        'Sucre es una ciudad colonial muy bonita, llena de historia.',
    motivoViaje: 'Visita cultural',
  ),
  FormularioOpinion(
    titulo: 'Esperamos Opinión',
    estado: false,
    lugarOrigen: '',
    lugarDestino: '',
    nombreAlojamiento: 'Hotel Los Ceibos',
    opinionAlojamiento: '',
    opionLugarDestino: '',
    motivoViaje: '',
  ),
  FormularioOpinion(
    titulo: 'Gracias por Responder',
    estado: true,
    lugarOrigen: 'Lima, Perú',
    lugarDestino: 'Arequipa, Perú',
    nombreAlojamiento: 'Hotel Libertador Arequipa',
    opinionAlojamiento:
        'Hotel lujoso, con excelente servicio y vistas impresionantes.',
    opionLugarDestino:
        'Arequipa es una ciudad hermosa con arquitectura colonial y hermosos paisajes.',
    motivoViaje: 'Aventura',
  ),
  FormularioOpinion(
    titulo: 'Esperamos Opinión',
    estado: false,
    lugarOrigen: '',
    lugarDestino: '',
    nombreAlojamiento: 'Hotel Camino Real',
    opinionAlojamiento: '',
    opionLugarDestino: '',
    motivoViaje: '',
  ),
  FormularioOpinion(
    titulo: 'Gracias por responder',
    estado: true,
    lugarOrigen: 'Lima, Perú',
    lugarDestino: 'Paracas, Perú',
    nombreAlojamiento: 'Hotel Paracas, a Luxury Collection Resort',
    opinionAlojamiento: 'Lugar perfecto para relajarse, excelente servicio.',
    opionLugarDestino:
        'Paracas tiene playas hermosas y la reserva nacional es impresionante.',
    motivoViaje: 'Escapada de fin de semana',
  ),
  FormularioOpinion(
    titulo: 'Esperamos Opinión',
    estado: false,
    lugarOrigen: '',
    lugarDestino: '',
    nombreAlojamiento: 'Hotel Presidente',
    opinionAlojamiento: '',
    opionLugarDestino: '',
    motivoViaje: '',
  ),
  FormularioOpinion(
    titulo: 'Gracias por Responder',
    estado: true,
    lugarOrigen: 'Santa Cruz, Bolivia',
    lugarDestino: 'La Paz, Bolivia',
    nombreAlojamiento: 'Hotel Europa',
    opinionAlojamiento: 'Muy buen servicio, habitaciones cómodas y limpias.',
    opionLugarDestino:
        'La ciudad es hermosa, pero el tráfico es un poco caótico.',
    motivoViaje: 'Negocios',
  ),
  FormularioOpinion(
    titulo: 'Esperamos Opinión',
    estado: false,
    lugarOrigen: '',
    lugarDestino: '',
    nombreAlojamiento: 'Hotel LP Columbus',
    opinionAlojamiento: '',
    opionLugarDestino: '',
    motivoViaje: '',
  ),
  FormularioOpinion(
    titulo: 'Gracias por responder',
    estado: true,
    lugarOrigen: 'Lima, Perú',
    lugarDestino: 'Cusco, Perú',
    nombreAlojamiento: 'Belmond Hotel Monasterio',
    opinionAlojamiento:
        'Excelente ubicación, muy buen servicio y desayuno delicioso.',
    opionLugarDestino: 'Cusco es mágico, lleno de historia y cultura.',
    motivoViaje: 'Turismo',
  ),
  FormularioOpinion(
    titulo: 'Esperamos Opinión',
    estado: false,
    lugarOrigen: '',
    lugarDestino: '',
    nombreAlojamiento: 'Hotel Europa',
    opinionAlojamiento: '',
    opionLugarDestino: '',
    motivoViaje: '',
  ),
  FormularioOpinion(
    titulo: 'Gracias por responder',
    estado: true,
    lugarOrigen: 'Lima, Perú',
    lugarDestino: 'Cusco, Perú',
    nombreAlojamiento: 'JW Marriott El Convento',
    opinionAlojamiento: 'Muy buen hotel con excelentes instalaciones.',
    opionLugarDestino: 'Cusco es una ciudad maravillosa con mucho que ofrecer.',
    motivoViaje: 'Vacaciones',
  ),
];

List<String> alojamientosIA = [
  "Hotel Monasterio",
  "Belmond Hotel Rio Sagrado",
  "Tambo del Inka",
  "Casa Andina Premium",
  "JW Marriott El Convento",
  "Titilaka Lodge",
  "Hotel Rosario",
  "Casa Grande Hotel",
  "Palacio del Inka",
  "Hotel Rosario Lago Titicaca"
];
