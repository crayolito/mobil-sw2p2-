class Alojamiento {
  String id;
  String nombreAlojamiento;
  String owner;
  String imageURL;
  String horarioAtencion;
  int nroAtencion;
  String ubicacionCoordenadas;
  String ubicacionDescriptiva;
  int nroEstrellas;
  String descripcionServiciosGenerales;
  List<String> tiposHabitaciones;
  String igUrl;
  String fbUrl;
  String webUrl;

  Alojamiento(
      {required this.id,
      required this.nombreAlojamiento,
      required this.owner,
      required this.imageURL,
      required this.horarioAtencion,
      required this.nroAtencion,
      required this.ubicacionCoordenadas,
      required this.ubicacionDescriptiva,
      required this.nroEstrellas,
      required this.descripcionServiciosGenerales,
      required this.tiposHabitaciones,
      required this.igUrl,
      required this.fbUrl,
      required this.webUrl});
}

List<Alojamiento> alojamientosDataAuxliar = [
  Alojamiento(
    id: '1',
    nombreAlojamiento: 'Hotel Cochabamba',
    owner: 'Juan Pérez',
    imageURL: 'https://example.com/image1.jpg',
    horarioAtencion: '24 horas',
    nroAtencion: 12345678,
    ubicacionCoordenadas: '-17.4110672912391, -66.16232111363139',
    ubicacionDescriptiva: 'Av. Heroínas Nro. 123, Cochabamba, Bolivia',
    nroEstrellas: 5,
    descripcionServiciosGenerales:
        'Piscina, Wi-Fi gratuito, Desayuno incluido, Gimnasio',
    tiposHabitaciones: ['Simple', 'Doble', 'Suite'],
    igUrl: 'https://instagram.com/hotelcochabamba',
    fbUrl: 'https://facebook.com/hotelcochabamba',
    webUrl: 'https://hotelcochabamba.com',
  ),
  Alojamiento(
    id: '2',
    nombreAlojamiento: 'Resort Santa Cruz',
    owner: 'María García',
    imageURL: 'https://example.com/image2.jpg',
    horarioAtencion: '24 horas',
    nroAtencion: 87654321,
    ubicacionCoordenadas: '-17.892642092804792, -60.735075224387025',
    ubicacionDescriptiva: 'Calle 21 de Mayo Nro. 456, Santa Cruz, Bolivia',
    nroEstrellas: 4,
    descripcionServiciosGenerales: 'Piscina, Spa, Restaurante, Wi-Fi gratuito',
    tiposHabitaciones: ['Simple', 'Doble', 'Familiar'],
    igUrl: 'https://instagram.com/resortsantacruz',
    fbUrl: 'https://facebook.com/resortsantacruz',
    webUrl: 'https://resortsantacruz.com',
  ),
  Alojamiento(
    id: '3',
    nombreAlojamiento: 'Eco Lodge Riberalta',
    owner: 'Carlos López',
    imageURL: 'https://example.com/image3.jpg',
    horarioAtencion: '08:00 - 20:00',
    nroAtencion: 11223344,
    ubicacionCoordenadas: '-13.622108735911063, -62.69064155694876',
    ubicacionDescriptiva:
        'Carretera Riberalta - Guayaramerín, Riberalta, Bolivia',
    nroEstrellas: 3,
    descripcionServiciosGenerales:
        'Tours ecológicos, Restaurante, Wi-Fi gratuito',
    tiposHabitaciones: ['Cabaña', 'Suite'],
    igUrl: 'https://instagram.com/ecolodgeriberalta',
    fbUrl: 'https://facebook.com/ecolodgeriberalta',
    webUrl: 'https://ecolodgeriberalta.com',
  ),
  Alojamiento(
    id: '4',
    nombreAlojamiento: 'Hostal Uyuni',
    owner: 'Ana Torres',
    imageURL: 'https://example.com/image4.jpg',
    horarioAtencion: '24 horas',
    nroAtencion: 44332211,
    ubicacionCoordenadas: '-21.38928573769647, -67.26095388473348',
    ubicacionDescriptiva: 'Calle Ferroviaria Nro. 789, Uyuni, Bolivia',
    nroEstrellas: 2,
    descripcionServiciosGenerales: 'Wi-Fi gratuito, Desayuno incluido',
    tiposHabitaciones: ['Simple', 'Doble'],
    igUrl: 'https://instagram.com/hostaluyuni',
    fbUrl: 'https://facebook.com/hostaluyuni',
    webUrl: 'https://hostaluyuni.com',
  ),
  Alojamiento(
    id: '5',
    nombreAlojamiento: 'Hotel Tarija',
    owner: 'Luis Suárez',
    imageURL: 'https://example.com/image5.jpg',
    horarioAtencion: '24 horas',
    nroAtencion: 55667788,
    ubicacionCoordenadas: '-21.59373497559833, -63.32784856418798',
    ubicacionDescriptiva: 'Av. La Paz Nro. 321, Tarija, Bolivia',
    nroEstrellas: 4,
    descripcionServiciosGenerales:
        'Piscina, Gimnasio, Restaurante, Wi-Fi gratuito',
    tiposHabitaciones: ['Simple', 'Doble', 'Suite'],
    igUrl: 'https://instagram.com/hoteltarija',
    fbUrl: 'https://facebook.com/hoteltarija',
    webUrl: 'https://hoteltarija.com',
  ),
  Alojamiento(
    id: '6',
    nombreAlojamiento: 'Hostel Rurrenabaque',
    owner: 'Fernando Vargas',
    imageURL: 'https://example.com/image6.jpg',
    horarioAtencion: '06:00 - 22:00',
    nroAtencion: 99887766,
    ubicacionCoordenadas: '-15.747462258079153, -65.50314145097012',
    ubicacionDescriptiva: 'Calle Comercio Nro. 456, Rurrenabaque, Bolivia',
    nroEstrellas: 2,
    descripcionServiciosGenerales: 'Tours, Wi-Fi gratuito, Desayuno incluido',
    tiposHabitaciones: ['Doble', 'Compartida'],
    igUrl: 'https://instagram.com/hostelrurre',
    fbUrl: 'https://facebook.com/hostelrurre',
    webUrl: 'https://hostelrurre.com',
  ),
  Alojamiento(
    id: '7',
    nombreAlojamiento: 'Hotel Puerto Suárez',
    owner: 'Rosa Fernández',
    imageURL: 'https://example.com/image7.jpg',
    horarioAtencion: '24 horas',
    nroAtencion: 22334455,
    ubicacionCoordenadas: '-19.080429212834375, -58.44991906049467',
    ubicacionDescriptiva: 'Av. Principal Nro. 123, Puerto Suárez, Bolivia',
    nroEstrellas: 3,
    descripcionServiciosGenerales: 'Piscina, Restaurante, Wi-Fi gratuito',
    tiposHabitaciones: ['Simple', 'Doble'],
    igUrl: 'https://instagram.com/hotelpuertosuarez',
    fbUrl: 'https://facebook.com/hotelpuertosuarez',
    webUrl: 'https://hotelpuertosuarez.com',
  ),
  Alojamiento(
    id: '8',
    nombreAlojamiento: 'Amazon Eco Lodge',
    owner: 'José Martínez',
    imageURL: 'https://example.com/image8.jpg',
    horarioAtencion: '08:00 - 18:00',
    nroAtencion: 33445566,
    ubicacionCoordenadas: '-11.92931063034313, -67.43673515460445',
    ubicacionDescriptiva: 'Río Madre de Dios, Bolivia',
    nroEstrellas: 4,
    descripcionServiciosGenerales:
        'Tours ecológicos, Restaurante, Wi-Fi gratuito',
    tiposHabitaciones: ['Cabaña', 'Suite'],
    igUrl: 'https://instagram.com/amazonecolodge',
    fbUrl: 'https://facebook.com/amazonecolodge',
    webUrl: 'https://amazonecolodge.com',
  ),
  Alojamiento(
    id: '9',
    nombreAlojamiento: 'Hotel Arequipa',
    owner: 'Miguel Ángel',
    imageURL: 'https://example.com/image9.jpg',
    horarioAtencion: '24 horas',
    nroAtencion: 11221122,
    ubicacionCoordenadas: '-15.270403357722895, -72.24599460490221',
    ubicacionDescriptiva: 'Calle Mercaderes Nro. 123, Arequipa, Perú',
    nroEstrellas: 5,
    descripcionServiciosGenerales: 'Piscina, Spa, Restaurante, Wi-Fi gratuito',
    tiposHabitaciones: ['Simple', 'Doble', 'Suite'],
    igUrl: 'https://instagram.com/hotelarequipa',
    fbUrl: 'https://facebook.com/hotelarequipa',
    webUrl: 'https://hotelarequipa.com',
  ),
  Alojamiento(
    id: '10',
    nombreAlojamiento: 'Eco Lodge Puno',
    owner: 'Lucía Ramos',
    imageURL: 'https://example.com/image10.jpg',
    horarioAtencion: '07:00 - 21:00',
    nroAtencion: 33446688,
    ubicacionCoordenadas: '-13.222476361309395, -69.44933214797399',
    ubicacionDescriptiva: 'Isla Taquile, Puno, Perú',
    nroEstrellas: 4,
    descripcionServiciosGenerales: 'Tours, Restaurante, Wi-Fi gratuito',
    tiposHabitaciones: ['Cabaña', 'Suite'],
    igUrl: 'https://instagram.com/ecolodgepuno',
    fbUrl: 'https://facebook.com/ecolodgepuno',
    webUrl: 'https://ecolodgepuno.com',
  ),
  Alojamiento(
    id: '11',
    nombreAlojamiento: 'Hotel Huancavelica',
    owner: 'Sofía Díaz',
    imageURL: 'https://example.com/image11.jpg',
    horarioAtencion: '24 horas',
    nroAtencion: 55667799,
    ubicacionCoordenadas: '-12.07033146878582, -74.91836095263362',
    ubicacionDescriptiva: 'Plaza de Armas, Huancavelica, Perú',
    nroEstrellas: 3,
    descripcionServiciosGenerales: 'Wi-Fi gratuito, Desayuno incluido',
    tiposHabitaciones: ['Simple', 'Doble'],
    igUrl: 'https://instagram.com/hotelhuancavelica',
    fbUrl: 'https://facebook.com/hotelhuancavelica',
    webUrl: 'https://hotelhuancavelica.com',
  ),
  Alojamiento(
    id: '12',
    nombreAlojamiento: 'Hostal Huaraz',
    owner: 'Julio Rivera',
    imageURL: 'https://example.com/image12.jpg',
    horarioAtencion: '06:00 - 22:00',
    nroAtencion: 66778899,
    ubicacionCoordenadas: '-8.339977196263328, -77.3732091092706',
    ubicacionDescriptiva: 'Calle José Olaya Nro. 321, Huaraz, Perú',
    nroEstrellas: 2,
    descripcionServiciosGenerales: 'Wi-Fi gratuito, Desayuno incluido',
    tiposHabitaciones: ['Doble', 'Compartida'],
    igUrl: 'https://instagram.com/hostalhuaraz',
    fbUrl: 'https://facebook.com/hostalhuaraz',
    webUrl: 'https://hostalhuaraz.com',
  ),
  Alojamiento(
    id: '13',
    nombreAlojamiento: 'Resort Iquitos',
    owner: 'Marta Jiménez',
    imageURL: 'https://example.com/image13.jpg',
    horarioAtencion: '24 horas',
    nroAtencion: 77889900,
    ubicacionCoordenadas: '-10.791137871881048, -72.37029071409901',
    ubicacionDescriptiva: 'Río Amazonas, Iquitos, Perú',
    nroEstrellas: 5,
    descripcionServiciosGenerales: 'Piscina, Spa, Restaurante, Wi-Fi gratuito',
    tiposHabitaciones: ['Simple', 'Doble', 'Suite'],
    igUrl: 'https://instagram.com/resortiquitos',
    fbUrl: 'https://facebook.com/resortiquitos',
    webUrl: 'https://resortiquitos.com',
  ),
  Alojamiento(
    id: '14',
    nombreAlojamiento: 'Hotel Chiclayo',
    owner: 'Elena Paredes',
    imageURL: 'https://example.com/image14.jpg',
    horarioAtencion: '24 horas',
    nroAtencion: 88990011,
    ubicacionCoordenadas: '-5.007204155071169, -77.90146757335705',
    ubicacionDescriptiva: 'Av. Balta Nro. 789, Chiclayo, Perú',
    nroEstrellas: 4,
    descripcionServiciosGenerales: 'Piscina, Restaurante, Wi-Fi gratuito',
    tiposHabitaciones: ['Simple', 'Doble', 'Suite'],
    igUrl: 'https://instagram.com/hotelchiclayo',
    fbUrl: 'https://facebook.com/hotelchiclayo',
    webUrl: 'https://hotelchiclayo.com',
  ),
  Alojamiento(
    id: '15',
    nombreAlojamiento: 'Amazon Lodge Loreto',
    owner: 'Pedro Torres',
    imageURL: 'https://example.com/image15.jpg',
    horarioAtencion: '08:00 - 18:00',
    nroAtencion: 99001122,
    ubicacionCoordenadas: '-4.170902599117611, -74.11043624285435',
    ubicacionDescriptiva: 'Reserva Nacional Pacaya Samiria, Loreto, Perú',
    nroEstrellas: 4,
    descripcionServiciosGenerales:
        'Tours ecológicos, Restaurante, Wi-Fi gratuito',
    tiposHabitaciones: ['Cabaña', 'Suite'],
    igUrl: 'https://instagram.com/amazonlodgeloreto',
    fbUrl: 'https://facebook.com/amazonlodgeloreto',
    webUrl: 'https://amazonlodgeloreto.com',
  ),
];
