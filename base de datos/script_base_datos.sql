/*
DROP TABLE FORMULARIO;
DROP TABLE COMUNAS;
DROP TABLE PROVINCIAS;
DROP TABLE REGIONES;
DROP TABLE VOTANTE;
DROP TABLE CANDIDATO;
*/


CREATE TABLE regiones (
  region_id NUMBER NOT NULL PRIMARY KEY,
  region_nombre varchar(64) NOT NULL,
  region_ordinal varchar(4) NOT NULL
);

CREATE TABLE provincias (
  provincia_id NUMBER NOT NULL PRIMARY KEY,
  provincia_nombre varchar(64) NOT NULL,
  region_id NUMBER NOT NULL
 );
 

 CREATE TABLE comunas (
  comuna_id NUMBER NOT NULL PRIMARY KEY,
  comuna_nombre varchar(64) NOT NULL,
  provincia_id NUMBER NOT NULL
);

CREATE TABLE VOTANTE(

  RUT VARCHAR(12) NOT NULL PRIMARY KEY,
  NOMBRES VARCHAR(50) NOT NULL,
  ALLIAS VARCHAR(30) NOT NULL,
  EMAIL VARCHAR(100) NOT NULL
);


CREATE TABLE CANDIDATO(

  ID_CANDIDATO VARCHAR(12) NOT NULL PRIMARY KEY,
  NOMBRES_CANDIDATO VARCHAR(50) NOT NULL
  
);

CREATE TABLE FORMULARIO(

  ID_FORMULARIO NUMBER NOT NULL PRIMARY KEY,
  RUT_VOTANTE VARCHAR(12) NOT NULL,
  ID_CANDIDATO VARCHAR(12) NOT NULL,
  ID_REGION NUMBER NOT NULL,
  ID_COMUNA NUMBER NOT NULL,
  VIA_WEB NUMBER(1),
  VIA_TV NUMBER(1),
  VIA_REDES_SOCIALES NUMBER(1),
  VIA_AMIGOS NUMBER(1) 
);

ALTER TABLE provincias ADD CONSTRAINT prov_region FOREIGN KEY (region_id) REFERENCES regiones (region_id);
ALTER TABLE comunas ADD CONSTRAINT comuna_prov FOREIGN KEY (provincia_id) REFERENCES provincias (provincia_id);
ALTER TABLE FORMULARIO ADD CONSTRAINT FORM_VOTANTE FOREIGN KEY (RUT_VOTANTE) REFERENCES VOTANTE (RUT);
ALTER TABLE FORMULARIO ADD CONSTRAINT FORM_CANDIDATO FOREIGN KEY (ID_CANDIDATO) REFERENCES CANDIDATO (ID_CANDIDATO);
ALTER TABLE FORMULARIO ADD CONSTRAINT FORM_REGION FOREIGN KEY (ID_REGION) REFERENCES REGIONES (REGION_ID);
ALTER TABLE FORMULARIO ADD CONSTRAINT FORM_COMUNA FOREIGN KEY (ID_COMUNA) REFERENCES COMUNAS (COMUNA_ID);


/*INSERTAR EN LA TABLA REGIONES*/
INSERT INTO regiones VALUES(1,'Arica y Parinacota','XV');
INSERT INTO regiones VALUES(2,'Tarapacá','I');
INSERT INTO regiones VALUES(3,'Antofagasta','II');
INSERT INTO regiones VALUES(4,'Atacama','III');
INSERT INTO regiones VALUES(5,'Coquimbo','IV');
INSERT INTO regiones VALUES(6,'Valparaiso','V');
INSERT INTO regiones VALUES(7,'Metropolitana de Santiago','RM');
INSERT INTO regiones VALUES(8,'Libertador General Bernardo OHiggins','VI');
INSERT INTO regiones VALUES(9,'Maule','VII');
INSERT INTO regiones VALUES(10,'Biobío','VIII');
INSERT INTO regiones VALUES(11,'La Araucanía','IX');
INSERT INTO regiones VALUES(12,'Los Ríos','XIV');
INSERT INTO regiones VALUES(13,'Los Lagos','X');
INSERT INTO regiones VALUES(14,'Aisén del General Carlos Ibáñez del Campo','XI');
INSERT INTO regiones VALUES(15,'Magallanes y de la Antártica Chilena','XII');

/*INSERTAR EN LA TABLA PROVINCIA*/

INSERT INTO provincias VALUES(1,'Arica',1);
INSERT INTO provincias VALUES(2,'Parinacota',1);
INSERT INTO provincias VALUES(3,'Iquique',2);
INSERT INTO provincias VALUES(4,'El Tamarugal',2);
INSERT INTO provincias VALUES(5,'Antofagasta',3);
INSERT INTO provincias VALUES(6,'El Loa',3);
INSERT INTO provincias VALUES(7,'Tocopilla',3);
INSERT INTO provincias VALUES(8,'Chañaral',4);
INSERT INTO provincias VALUES(9,'Copiapó',4);
INSERT INTO provincias VALUES(10,'Huasco',4);
INSERT INTO provincias VALUES(11,'Choapa',5);
INSERT INTO provincias VALUES(12,'Elqui',5);
INSERT INTO provincias VALUES(13,'Limarí',5);
INSERT INTO provincias VALUES(14,'Isla de Pascua',6);
INSERT INTO provincias VALUES(15,'Los Andes',6);
INSERT INTO provincias VALUES(16,'Petorca',6);
INSERT INTO provincias VALUES(17,'Quillota',6);
INSERT INTO provincias VALUES(18,'San Antonio',6);
INSERT INTO provincias VALUES(19,'San Felipe de Aconcagua',6);
INSERT INTO provincias VALUES(20,'Valparaiso',6);
INSERT INTO provincias VALUES(21,'Chacabuco',7);
INSERT INTO provincias VALUES(22,'Cordillera',7);
INSERT INTO provincias VALUES(23,'Maipo',7);
INSERT INTO provincias VALUES(24,'Melipilla',7);
INSERT INTO provincias VALUES(25,'Santiago',7);
INSERT INTO provincias VALUES(26,'Talagante',7);
INSERT INTO provincias VALUES(27,'Cachapoal',8);
INSERT INTO provincias VALUES(28,'Cardenal Caro',8);
INSERT INTO provincias VALUES(29,'Colchagua',8);
INSERT INTO provincias VALUES(30,'Cauquenes',9);
INSERT INTO provincias VALUES(31,'Curicó',9);
INSERT INTO provincias VALUES(32,'Linares',9);
INSERT INTO provincias VALUES(33,'Talca',9);
INSERT INTO provincias VALUES(34,'Arauco',10);
INSERT INTO provincias VALUES(35,'Bio Bío',10);
INSERT INTO provincias VALUES(36,'Concepción',10);
INSERT INTO provincias VALUES(37,'Ñuble',10);
INSERT INTO provincias VALUES(38,'Cautín',11);
INSERT INTO provincias VALUES(39,'Malleco',11);
INSERT INTO provincias VALUES(40,'Valdivia',12);
INSERT INTO provincias VALUES(41,'Ranco',12);
INSERT INTO provincias VALUES(42,'Chiloé',13);
INSERT INTO provincias VALUES(43,'Llanquihue',13);
INSERT INTO provincias VALUES(44,'Osorno',13);
INSERT INTO provincias VALUES(45,'Palena',13);
INSERT INTO provincias VALUES(46,'Aisén',14);
INSERT INTO provincias VALUES(47,'Capitán Prat',14);
INSERT INTO provincias VALUES(48,'Coihaique',14);
INSERT INTO provincias VALUES(49,'General Carrera',14);
INSERT INTO provincias VALUES(50,'Antártica Chilena',15);
INSERT INTO provincias VALUES(51,'Magallanes',15);
INSERT INTO provincias VALUES(52,'Tierra del Fuego',15);
INSERT INTO provincias VALUES(53,'Última Esperanza',15);


/*INSERTAR EN LA TABLA COMUNAS*/

INSERT INTO comunas VALUES(1,'Arica',1);
INSERT INTO comunas VALUES(2,'Camarones',1);
INSERT INTO comunas VALUES(3,'General Lagos',2);
INSERT INTO comunas VALUES(4,'Putre',2);
INSERT INTO comunas VALUES(5,'Alto Hospicio',3);
INSERT INTO comunas VALUES(6,'Iquique',3);
INSERT INTO comunas VALUES(7,'Camiña',4);
INSERT INTO comunas VALUES(8,'Colchane',4);
INSERT INTO comunas VALUES(9,'Huara',4);
INSERT INTO comunas VALUES(10,'Pica',4);
INSERT INTO comunas VALUES(11,'Pozo Almonte',4);
INSERT INTO comunas VALUES(12,'Antofagasta',5);
INSERT INTO comunas VALUES(13,'Mejillones',5);
INSERT INTO comunas VALUES(14,'Sierra Gorda',5);
INSERT INTO comunas VALUES(15,'Taltal',5);
INSERT INTO comunas VALUES(16,'Calama',6);
INSERT INTO comunas VALUES(17,'Ollague',6);
INSERT INTO comunas VALUES(18,'San Pedro de Atacama',6);
INSERT INTO comunas VALUES(19,'María Elena',7);
INSERT INTO comunas VALUES(20,'Tocopilla',7);
INSERT INTO comunas VALUES(21,'Chañaral',8);
INSERT INTO comunas VALUES(22,'Diego de Almagro',8);
INSERT INTO comunas VALUES(23,'Caldera',9);
INSERT INTO comunas VALUES(24,'Copiapó',9);
INSERT INTO comunas VALUES(25,'Tierra Amarilla',9);
INSERT INTO comunas VALUES(26,'Alto del Carmen',10);
INSERT INTO comunas VALUES(27,'Freirina',10);
INSERT INTO comunas VALUES(28,'Huasco',10);
INSERT INTO comunas VALUES(29,'Vallenar',10);
INSERT INTO comunas VALUES(30,'Canela',11);
INSERT INTO comunas VALUES(31,'Illapel',11);
INSERT INTO comunas VALUES(32,'Los Vilos',11);
INSERT INTO comunas VALUES(33,'Salamanca',11);
INSERT INTO comunas VALUES(34,'Andacollo',12);
INSERT INTO comunas VALUES(35,'Coquimbo',12);
INSERT INTO comunas VALUES(36,'La Higuera',12);
INSERT INTO comunas VALUES(37,'La Serena',12);
INSERT INTO comunas VALUES(38,'Paihuaco',12);
INSERT INTO comunas VALUES(39,'Vicuña',12);
INSERT INTO comunas VALUES(40,'Combarbalá',13);
INSERT INTO comunas VALUES(41,'Monte Patria',13);
INSERT INTO comunas VALUES(42,'Ovalle',13);
INSERT INTO comunas VALUES(43,'Punitaqui',13);
INSERT INTO comunas VALUES(44,'Río Hurtado',13);
INSERT INTO comunas VALUES(45,'Isla de Pascua',14);
INSERT INTO comunas VALUES(46,'Calle Larga',15);
INSERT INTO comunas VALUES(47,'Los Andes',15);
INSERT INTO comunas VALUES(48,'Rinconada',15);
INSERT INTO comunas VALUES(49,'San Esteban',15);
INSERT INTO comunas VALUES(50,'La Ligua',16);
INSERT INTO comunas VALUES(51,'Papudo',16);
INSERT INTO comunas VALUES(52,'Petorca',16);
INSERT INTO comunas VALUES(53,'Zapallar',16);
INSERT INTO comunas VALUES(54,'Hijuelas',17);
INSERT INTO comunas VALUES(55,'La Calera',17);
INSERT INTO comunas VALUES(56,'La Cruz',17);
INSERT INTO comunas VALUES(57,'Limache',17);
INSERT INTO comunas VALUES(58,'Nogales',17);
INSERT INTO comunas VALUES(59,'Olmué',17);
INSERT INTO comunas VALUES(60,'Quillota',17);
INSERT INTO comunas VALUES(61,'Algarrobo',18);
INSERT INTO comunas VALUES(62,'Cartagena',18);
INSERT INTO comunas VALUES(63,'El Quisco',18);
INSERT INTO comunas VALUES(64,'El Tabo',18);
INSERT INTO comunas VALUES(65,'San Antonio',18);
INSERT INTO comunas VALUES(66,'Santo Domingo',18);
INSERT INTO comunas VALUES(67,'Catemu',19);
INSERT INTO comunas VALUES(68,'Llaillay',19);
INSERT INTO comunas VALUES(69,'Panquehue',19);
INSERT INTO comunas VALUES(70,'Putaendo',19);
INSERT INTO comunas VALUES(71,'San Felipe',19);
INSERT INTO comunas VALUES(72,'Santa María',19);
INSERT INTO comunas VALUES(73,'Casablanca',20);
INSERT INTO comunas VALUES(74,'Concón',20);
INSERT INTO comunas VALUES(75,'Juan Fernández',20);
INSERT INTO comunas VALUES(76,'Puchuncaví',20);
INSERT INTO comunas VALUES(77,'Quilpué',20);
INSERT INTO comunas VALUES(78,'Quintero',20);
INSERT INTO comunas VALUES(79,'Valparaíso',20);
INSERT INTO comunas VALUES(80,'Villa Alemana',20);
INSERT INTO comunas VALUES(81,'Viña del Mar',20);
INSERT INTO comunas VALUES(82,'Colina',21);
INSERT INTO comunas VALUES(83,'Lampa',21);
INSERT INTO comunas VALUES(84,'Tiltil',21);
INSERT INTO comunas VALUES(85,'Pirque',22);
INSERT INTO comunas VALUES(86,'Puente Alto',22);
INSERT INTO comunas VALUES(87,'San José de Maipo',22);
INSERT INTO comunas VALUES(88,'Buin',23);
INSERT INTO comunas VALUES(89,'Calera de Tango',23);
INSERT INTO comunas VALUES(90,'Paine',23);
INSERT INTO comunas VALUES(91,'San Bernardo',23);
INSERT INTO comunas VALUES(92,'Alhué',24);
INSERT INTO comunas VALUES(93,'Curacaví',24);
INSERT INTO comunas VALUES(94,'María Pinto',24);
INSERT INTO comunas VALUES(95,'Melipilla',24);
INSERT INTO comunas VALUES(96,'San Pedro',24);
INSERT INTO comunas VALUES(97,'Cerrillos',25);
INSERT INTO comunas VALUES(98,'Cerro Navia',25);
INSERT INTO comunas VALUES(99,'Conchalí',25);
INSERT INTO comunas VALUES(100,'El Bosque',25);
INSERT INTO comunas VALUES(101,'Estación Central',25);
INSERT INTO comunas VALUES(102,'Huechuraba',25);
INSERT INTO comunas VALUES(103,'Independencia',25);
INSERT INTO comunas VALUES(104,'La Cisterna',25);
INSERT INTO comunas VALUES(105,'La Granja',25);
INSERT INTO comunas VALUES(106,'La Florida',25);
INSERT INTO comunas VALUES(107,'La Pintana',25);
INSERT INTO comunas VALUES(108,'La Reina',25);
INSERT INTO comunas VALUES(109,'Las Condes',25);
INSERT INTO comunas VALUES(110,'Lo Barnechea',25);
INSERT INTO comunas VALUES(111,'Lo Espejo',25);
INSERT INTO comunas VALUES(112,'Lo Prado',25);
INSERT INTO comunas VALUES(113,'Macul',25);
INSERT INTO comunas VALUES(114,'Maipú',25);
INSERT INTO comunas VALUES(115,'Ñuñoa',25);
INSERT INTO comunas VALUES(116,'Pedro Aguirre Cerda',25);
INSERT INTO comunas VALUES(117,'Peñalolén',25);
INSERT INTO comunas VALUES(118,'Providencia',25);
INSERT INTO comunas VALUES(119,'Pudahuel',25);
INSERT INTO comunas VALUES(120,'Quilicura',25);
INSERT INTO comunas VALUES(121,'Quinta Normal',25);
INSERT INTO comunas VALUES(122,'Recoleta',25);
INSERT INTO comunas VALUES(123,'Renca',25);
INSERT INTO comunas VALUES(124,'San Miguel',25);
INSERT INTO comunas VALUES(125,'San Joaquín',25);
INSERT INTO comunas VALUES(126,'San Ramón',25);
INSERT INTO comunas VALUES(127,'Santiago',25);
INSERT INTO comunas VALUES(128,'Vitacura',25);
INSERT INTO comunas VALUES(129,'El Monte',26);
INSERT INTO comunas VALUES(130,'Isla de Maipo',26);
INSERT INTO comunas VALUES(131,'Padre Hurtado',26);
INSERT INTO comunas VALUES(132,'Peñaflor',26);
INSERT INTO comunas VALUES(133,'Talagante',26);
INSERT INTO comunas VALUES(134,'Codegua',27);
INSERT INTO comunas VALUES(135,'Coínco',27);
INSERT INTO comunas VALUES(136,'Coltauco',27);
INSERT INTO comunas VALUES(137,'Doñihue',27);
INSERT INTO comunas VALUES(138,'Graneros',27);
INSERT INTO comunas VALUES(139,'Las Cabras',27);
INSERT INTO comunas VALUES(140,'Machalí',27);
INSERT INTO comunas VALUES(141,'Malloa',27);
INSERT INTO comunas VALUES(142,'Mostazal',27);
INSERT INTO comunas VALUES(143,'Olivar',27);
INSERT INTO comunas VALUES(144,'Peumo',27);
INSERT INTO comunas VALUES(145,'Pichidegua',27);
INSERT INTO comunas VALUES(146,'Quinta de Tilcoco',27);
INSERT INTO comunas VALUES(147,'Rancagua',27);
INSERT INTO comunas VALUES(148,'Rengo',27);
INSERT INTO comunas VALUES(149,'Requínoa',27);
INSERT INTO comunas VALUES(150,'San Vicente de Tagua Tagua',27);
INSERT INTO comunas VALUES(151,'La Estrella',28);
INSERT INTO comunas VALUES(152,'Litueche',28);
INSERT INTO comunas VALUES(153,'Marchihue',28);
INSERT INTO comunas VALUES(154,'Navidad',28);
INSERT INTO comunas VALUES(155,'Peredones',28);
INSERT INTO comunas VALUES(156,'Pichilemu',28);
INSERT INTO comunas VALUES(157,'Chépica',29);
INSERT INTO comunas VALUES(158,'Chimbarongo',29);
INSERT INTO comunas VALUES(159,'Lolol',29);
INSERT INTO comunas VALUES(160,'Nancagua',29);
INSERT INTO comunas VALUES(161,'Palmilla',29);
INSERT INTO comunas VALUES(162,'Peralillo',29);
INSERT INTO comunas VALUES(163,'Placilla',29);
INSERT INTO comunas VALUES(164,'Pumanque',29);
INSERT INTO comunas VALUES(165,'San Fernando',29);
INSERT INTO comunas VALUES(166,'Santa Cruz',29);
INSERT INTO comunas VALUES(167,'Cauquenes',30);
INSERT INTO comunas VALUES(168,'Chanco',30);
INSERT INTO comunas VALUES(169,'Pelluhue',30);
INSERT INTO comunas VALUES(170,'Curicó',31);
INSERT INTO comunas VALUES(171,'Hualañé',31);
INSERT INTO comunas VALUES(172,'Licantén',31);
INSERT INTO comunas VALUES(173,'Molina',31);
INSERT INTO comunas VALUES(174,'Rauco',31);
INSERT INTO comunas VALUES(175,'Romeral',31);
INSERT INTO comunas VALUES(176,'Sagrada Familia',31);
INSERT INTO comunas VALUES(177,'Teno',31);
INSERT INTO comunas VALUES(178,'Vichuquén',31);
INSERT INTO comunas VALUES(179,'Colbún',32);
INSERT INTO comunas VALUES(180,'Linares',32);
INSERT INTO comunas VALUES(181,'Longaví',32);
INSERT INTO comunas VALUES(182,'Parral',32);
INSERT INTO comunas VALUES(183,'Retiro',32);
INSERT INTO comunas VALUES(184,'San Javier',32);
INSERT INTO comunas VALUES(185,'Villa Alegre',32);
INSERT INTO comunas VALUES(186,'Yerbas Buenas',32);
INSERT INTO comunas VALUES(187,'Constitución',33);
INSERT INTO comunas VALUES(188,'Curepto',33);
INSERT INTO comunas VALUES(189,'Empedrado',33);
INSERT INTO comunas VALUES(190,'Maule',33);
INSERT INTO comunas VALUES(191,'Pelarco',33);
INSERT INTO comunas VALUES(192,'Pencahue',33);
INSERT INTO comunas VALUES(193,'Río Claro',33);
INSERT INTO comunas VALUES(194,'San Clemente',33);
INSERT INTO comunas VALUES(195,'San Rafael',33);
INSERT INTO comunas VALUES(196,'Talca',33);
INSERT INTO comunas VALUES(197,'Arauco',34);
INSERT INTO comunas VALUES(198,'Cañete',34);
INSERT INTO comunas VALUES(199,'Contulmo',34);
INSERT INTO comunas VALUES(200,'Curanilahue',34);
INSERT INTO comunas VALUES(201,'Lebu',34);
INSERT INTO comunas VALUES(202,'Los Álamos',34);
INSERT INTO comunas VALUES(203,'Tirúa',34);
INSERT INTO comunas VALUES(204,'Alto Biobío',35);
INSERT INTO comunas VALUES(205,'Antuco',35);
INSERT INTO comunas VALUES(206,'Cabrero',35);
INSERT INTO comunas VALUES(207,'Laja',35);
INSERT INTO comunas VALUES(208,'Los Ángeles',35);
INSERT INTO comunas VALUES(209,'Mulchén',35);
INSERT INTO comunas VALUES(210,'Nacimiento',35);
INSERT INTO comunas VALUES(211,'Negrete',35);
INSERT INTO comunas VALUES(212,'Quilaco',35);
INSERT INTO comunas VALUES(213,'Quilleco',35);
INSERT INTO comunas VALUES(214,'San Rosendo',35);
INSERT INTO comunas VALUES(215,'Santa Bárbara',35);
INSERT INTO comunas VALUES(216,'Tucapel',35);
INSERT INTO comunas VALUES(217,'Yumbel',35);
INSERT INTO comunas VALUES(218,'Chiguayante',36);
INSERT INTO comunas VALUES(219,'Concepción',36);
INSERT INTO comunas VALUES(220,'Coronel',36);
INSERT INTO comunas VALUES(221,'Florida',36);
INSERT INTO comunas VALUES(222,'Hualpén',36);
INSERT INTO comunas VALUES(223,'Hualqui',36);
INSERT INTO comunas VALUES(224,'Lota',36);
INSERT INTO comunas VALUES(225,'Penco',36);
INSERT INTO comunas VALUES(226,'San Pedro de La Paz',36);
INSERT INTO comunas VALUES(227,'Santa Juana',36);
INSERT INTO comunas VALUES(228,'Talcahuano',36);
INSERT INTO comunas VALUES(229,'Tomé',36);
INSERT INTO comunas VALUES(230,'Bulnes',37);
INSERT INTO comunas VALUES(231,'Chillán',37);
INSERT INTO comunas VALUES(232,'Chillán Viejo',37);
INSERT INTO comunas VALUES(233,'Cobquecura',37);
INSERT INTO comunas VALUES(234,'Coelemu',37);
INSERT INTO comunas VALUES(235,'Coihueco',37);
INSERT INTO comunas VALUES(236,'El Carmen',37);
INSERT INTO comunas VALUES(237,'Ninhue',37);
INSERT INTO comunas VALUES(238,'Ñiquen',37);
INSERT INTO comunas VALUES(239,'Pemuco',37);
INSERT INTO comunas VALUES(240,'Pinto',37);
INSERT INTO comunas VALUES(241,'Portezuelo',37);
INSERT INTO comunas VALUES(242,'Quillón',37);
INSERT INTO comunas VALUES(243,'Quirihue',37);
INSERT INTO comunas VALUES(244,'Ránquil',37);
INSERT INTO comunas VALUES(245,'San Carlos',37);
INSERT INTO comunas VALUES(246,'San Fabián',37);
INSERT INTO comunas VALUES(247,'San Ignacio',37);
INSERT INTO comunas VALUES(248,'San Nicolás',37);
INSERT INTO comunas VALUES(249,'Treguaco',37);
INSERT INTO comunas VALUES(250,'Yungay',37);
INSERT INTO comunas VALUES(251,'Carahue',38);
INSERT INTO comunas VALUES(252,'Cholchol',38);
INSERT INTO comunas VALUES(253,'Cunco',38);
INSERT INTO comunas VALUES(254,'Curarrehue',38);
INSERT INTO comunas VALUES(255,'Freire',38);
INSERT INTO comunas VALUES(256,'Galvarino',38);
INSERT INTO comunas VALUES(257,'Gorbea',38);
INSERT INTO comunas VALUES(258,'Lautaro',38);
INSERT INTO comunas VALUES(259,'Loncoche',38);
INSERT INTO comunas VALUES(260,'Melipeuco',38);
INSERT INTO comunas VALUES(261,'Nueva Imperial',38);
INSERT INTO comunas VALUES(262,'Padre Las Casas',38);
INSERT INTO comunas VALUES(263,'Perquenco',38);
INSERT INTO comunas VALUES(264,'Pitrufquén',38);
INSERT INTO comunas VALUES(265,'Pucón',38);
INSERT INTO comunas VALUES(266,'Saavedra',38);
INSERT INTO comunas VALUES(267,'Temuco',38);
INSERT INTO comunas VALUES(268,'Teodoro Schmidt',38);
INSERT INTO comunas VALUES(269,'Toltén',38);
INSERT INTO comunas VALUES(270,'Vilcún',38);
INSERT INTO comunas VALUES(271,'Villarrica',38);
INSERT INTO comunas VALUES(272,'Angol',39);
INSERT INTO comunas VALUES(273,'Collipulli',39);
INSERT INTO comunas VALUES(274,'Curacautín',39);
INSERT INTO comunas VALUES(275,'Ercilla',39);
INSERT INTO comunas VALUES(276,'Lonquimay',39);
INSERT INTO comunas VALUES(277,'Los Sauces',39);
INSERT INTO comunas VALUES(278,'Lumaco',39);
INSERT INTO comunas VALUES(279,'Purén',39);
INSERT INTO comunas VALUES(280,'Renaico',39);
INSERT INTO comunas VALUES(281,'Traiguén',39);
INSERT INTO comunas VALUES(282,'Victoria',39);
INSERT INTO comunas VALUES(283,'Corral',40);
INSERT INTO comunas VALUES(284,'Lanco',40);
INSERT INTO comunas VALUES(285,'Los Lagos',40);
INSERT INTO comunas VALUES(286,'Máfil',40);
INSERT INTO comunas VALUES(287,'Mariquina',40);
INSERT INTO comunas VALUES(288,'Paillaco',40);
INSERT INTO comunas VALUES(289,'Panguipulli',40);
INSERT INTO comunas VALUES(290,'Valdivia',40);
INSERT INTO comunas VALUES(291,'Futrono',41);
INSERT INTO comunas VALUES(292,'La Unión',41);
INSERT INTO comunas VALUES(293,'Lago Ranco',41);
INSERT INTO comunas VALUES(294,'Río Bueno',41);
INSERT INTO comunas VALUES(295,'Ancud',42);
INSERT INTO comunas VALUES(296,'Castro',42);
INSERT INTO comunas VALUES(297,'Chonchi',42);
INSERT INTO comunas VALUES(298,'Curaco de Vélez',42);
INSERT INTO comunas VALUES(299,'Dalcahue',42);
INSERT INTO comunas VALUES(300,'Puqueldón',42);
INSERT INTO comunas VALUES(301,'Queilén',42);
INSERT INTO comunas VALUES(302,'Quemchi',42);
INSERT INTO comunas VALUES(303,'Quellón',42);
INSERT INTO comunas VALUES(304,'Quinchao',42);
INSERT INTO comunas VALUES(305,'Calbuco',43);
INSERT INTO comunas VALUES(306,'Cochamó',43);
INSERT INTO comunas VALUES(307,'Fresia',43);
INSERT INTO comunas VALUES(308,'Frutillar',43);
INSERT INTO comunas VALUES(309,'Llanquihue',43);
INSERT INTO comunas VALUES(310,'Los Muermos',43);
INSERT INTO comunas VALUES(311,'Maullín',43);
INSERT INTO comunas VALUES(312,'Puerto Montt',43);
INSERT INTO comunas VALUES(313,'Puerto Varas',43);
INSERT INTO comunas VALUES(314,'Osorno',44);
INSERT INTO comunas VALUES(315,'Puero Octay',44);
INSERT INTO comunas VALUES(316,'Purranque',44);
INSERT INTO comunas VALUES(317,'Puyehue',44);
INSERT INTO comunas VALUES(318,'Río Negro',44);
INSERT INTO comunas VALUES(319,'San Juan de la Costa',44);
INSERT INTO comunas VALUES(320,'San Pablo',44);
INSERT INTO comunas VALUES(321,'Chaitén',45);
INSERT INTO comunas VALUES(322,'Futaleufú',45);
INSERT INTO comunas VALUES(323,'Hualaihué',45);
INSERT INTO comunas VALUES(324,'Palena',45);
INSERT INTO comunas VALUES(325,'Aisén',46);
INSERT INTO comunas VALUES(326,'Cisnes',46);
INSERT INTO comunas VALUES(327,'Guaitecas',46);
INSERT INTO comunas VALUES(328,'Cochrane',47);
INSERT INTO comunas VALUES(329,'Ohiggins',47);
INSERT INTO comunas VALUES(330,'Tortel',47);
INSERT INTO comunas VALUES(331,'Coihaique',48);
INSERT INTO comunas VALUES(332,'Lago Verde',48);
INSERT INTO comunas VALUES(333,'Chile Chico',49);
INSERT INTO comunas VALUES(334,'Río Ibáñez',49);
INSERT INTO comunas VALUES(335,'Antártica',50);
INSERT INTO comunas VALUES(336,'Cabo de Hornos',50);
INSERT INTO comunas VALUES(337,'Laguna Blanca',51);
INSERT INTO comunas VALUES(338,'Punta Arenas',51);
INSERT INTO comunas VALUES(339,'Río Verde',51);
INSERT INTO comunas VALUES(340,'San Gregorio',51);
INSERT INTO comunas VALUES(341,'Porvenir',52);
INSERT INTO comunas VALUES(342,'Primavera',52);
INSERT INTO comunas VALUES(343,'Timaukel',52);
INSERT INTO comunas VALUES(344,'Natales',53);
INSERT INTO comunas VALUES(345,'Torres del Paine',53);

COMMIT;
