
-- $Header: dbI.SQL_V 1.0 01/10/18 23:30

-- SELECT 'Tworzenie bazy danych!';
use uczelnia;


DROP TABLE if exists WYKLADOWCY CASCADE;
CREATE TABLE WYKLADOWCY
(ID_WYKLADOWCY  VARCHAR(4) NOT NULL,
 Nazwisko		VARCHAR(25) NOT NULL,
 Imie			VARCHAR(25),
 Kod			VARCHAR(6),
 Miasto			VARCHAR(20),
 E_mail			VARCHAR(30),
     CONSTRAINT wyk_id_pk PRIMARY KEY (ID_WYKLADOWCY));


INSERT INTO WYKLADOWCY VALUES (
   '0001', 'Kowalski', 'Dariusz', '20-001', 'Lublin', 'dkowalski@lublin.pl');
INSERT INTO WYKLADOWCY VALUES (
   '0002', 'Kowalski', 'Mateusz', '20-010', 'Lublin', 'mati.kowalski@lublin.pl');
INSERT INTO WYKLADOWCY VALUES (
   '0003', 'Nowak', 'Wojciech', '35-330', 'Rzeszów', 'wnowak@rzeszow.pl');
INSERT INTO WYKLADOWCY VALUES (
   '0004', 'Grabara', 'Piotr', '20-300', 'Lublin',  'grabpiotr@lublin.pl');
INSERT INTO WYKLADOWCY VALUES (
   '0005', 'Dudek', 'Wojciech', '35-330', 'Rzeszów','dudi@rzeszow.pl');
INSERT INTO WYKLADOWCY VALUES (
   '0006', 'Szczęsny', 'Piotr', '20-070', 'Lublin', 'szczepio@pollub.pl');
INSERT INTO WYKLADOWCY VALUES (
   '0007', 'Mila', 'Maciej', '35-615', 'Rzeszów','milamac@rzeszow.pl');
INSERT INTO WYKLADOWCY VALUES (
   '0008', 'Boruc', 'Mateusz', '20-555', 'Lublin', 'borimati@lublin.pl');
INSERT INTO WYKLADOWCY VALUES (
   '0009', 'Sum', 'Andrzej', '39-200', 'Dębica',  'sumand@debica.pl');
INSERT INTO WYKLADOWCY VALUES (
   '0036', 'Krawiec', 'Alicja', '30-210', 'Kraków', 'alikra@krak.pl');

COMMIT;


DROP TABLE if exists STUDENCI CASCADE ;
CREATE TABLE STUDENCI
(ID_Studenta		VARCHAR(7) NOT NULL,
 Nazwisko		VARCHAR(25) NOT NULL,
 Imie			VARCHAR(25),
 Data_ur		DATE,
 Miejsce		VARCHAR(15),
 PESEL			VARCHAR(11),
 Kod			VARCHAR(6),
 Miasto			VARCHAR(15),
 Ulica			VARCHAR(30),
 Numer			VARCHAR(8),
 Tel			VARCHAR(12),
 E_mail			VARCHAR(30),
   CONSTRAINT St_id_pk PRIMARY KEY (ID_Studenta),
   CONSTRAINT St_PESEL_uk UNIQUE (PESEL));


INSERT INTO STUDENCI VALUES (
   '1600049', 'Modra', 'Anna', NULL, 'Lubaczów',
   '88020112345', '35-500', 'Rzeszów', 'Daszyńskiego', '119',
   NULL, NULL);
INSERT INTO STUDENCI VALUES (
   '1700050', 'Wójcik', 'Katarzyna', NULL, 'Lipnik',
   '89051799666', '20-322', 'Lubartów', 'Długa', '5',
   NULL, NULL);
INSERT INTO STUDENCI VALUES (
   '1800060', 'Słowik', 'Antoni', NULL, 'Rzeszów',
   '91060686972', '35-500', 'Rzeszów', 'Jazowa', '18/71',
   '815267514', NULL);
INSERT INTO STUDENCI VALUES (
   '1700061', 'Słowik', 'Kamila', NULL, 'Rzeszów',
   '90091011456', '35-615', 'Rzeszów', 'Jazowa', '18/71',
   '815267514', NULL);
INSERT INTO STUDENCI VALUES (
   '1600062', 'Mięta', 'Mateusz', NULL, 'Rzeszów',
   '92111298745', '35-615', 'Rzeszów', 'Śnieżyńskiego', '9',
   '815341144', NULL);
INSERT INTO STUDENCI VALUES (
   '1700063', 'Kusza', 'Anna', NULL, 'Krasienin',
   '87122236159', '21-025', 'Krasienin', 'Kr. Jadwigi', '25',
   '825764636', NULL);
INSERT INTO STUDENCI VALUES (
   '1800323', 'Piechowicz', 'Aneta', NULL, 'Kranse',
   '93031475315', '24-300', 'Wrzelowiec', 'Krasna', '165a',
   NULL, NULL);
INSERT INTO STUDENCI VALUES (
   '1700324', 'Student', 'Iwona', NULL, 'Dębica',
   '92070896321', '76-211', 'Dębina', 'Medalionów', '36',
   '846800136', NULL);
INSERT INTO STUDENCI VALUES (
   '1600325', 'Maj', 'Paulina', NULL, 'Siedlce',
   '93020285231', '08-100', 'Rzeszów', 'Kasprowicza', '1',
   '2222864', NULL);
INSERT INTO STUDENCI VALUES (
   '1700326', 'Dyrda', 'Matylda', NULL, 'Rzeszów',
   '94103074123', '20-001', 'Lublin', 'Wierzbowa', '13/82',
   '817452594', NULL);
COMMIT;


DROP TABLE if exists kierunki CASCADE ;
CREATE TABLE kierunki
(ID_Kierunku			INT(2)  NOT NULL,
 nazwa		VARCHAR(80)  NOT NULL,
 Opis			VARCHAR(255),
 Stopien			VARCHAR(15) NOT NULL,
 S_ECTS			INT(5) DEFAULT 70,
   CONSTRAINT kier_id_pk PRIMARY KEY (ID_Kierunku));

INSERT INTO kierunki VALUES (
  1, 'Informatyka techniczna', 'Nauczanie informatyki na poziomie szkół podstawowych i średnich', 'Licencjat', 40);
INSERT INTO kierunki VALUES (
  2, 'Grafika komputerowa', 'Tworzenie grafiki komputerowej w multimediach', 'Inżynier', 60);
INSERT INTO kierunki VALUES (
  3, 'Bazy danych', 'Projektowanie, tworzenie, administracja i eksploatacja baz danych', 'Inżynier', 60);
INSERT INTO kierunki VALUES (
  4, 'Gry i multimedia', 'Tworzenie gier komputerowych, zastosowania mulimediów', 'Licencjat', 60);
INSERT INTO kierunki VALUES (
  5, 'Bankowość i ubezpieczenia', 'Wykorzystanie IT w bankowości i ubezpieczeniach, podstawy matematyczne', 'Licencjat', 70);
INSERT INTO kierunki VALUES (
  6, 'Systemy klasy ERP', 'Zarzšdzanie systemami wsparcia procesów biznesowych w przedsiębiorstwie', 'Inżynier', 60);
INSERT INTO kierunki VALUES (
  7, 'BI i systemy eksperckie', 'Intelignetne systemy wspomogania podejmowania decyzji', 'Magister', 70);
INSERT INTO kierunki VALUES (
  8, 'Przetwarzanie obrazów medycznych', 'Pozyskiwanie i przetwarzanie obrazów medycznych', 'Inżynier', 50);
INSERT INTO kierunki VALUES (
  9, 'Zarzšdzanie zespołem', 'Tworzenie i zarządzanie zespołami projektowycmi', 'Magister', 70);
INSERT INTO kierunki VALUES (
 10, 'Logistyka z elementami zarzšdzania', 'Zarzšdzania łańcchem przepływów dóbr i usług w gospodarce', 'Inżynier', 60);
COMMIT;


DROP TABLE if exists PRZEDMIOTY CASCADE ;
CREATE TABLE przedmioty
(ID_Przedmiotu		INT(1) NOT NULL,
 nazwa		VARCHAR(40)  NOT NULL,
  Opis			VARCHAR(200),
 rodzaj		VARCHAR(10) DEFAULT 'Wykład',   
 ECTS		INT DEFAULT 10,
   CONSTRAINT prz_id_pk PRIMARY KEY (ID_Przedmiotu),
   CONSTRAINT prz_ECTS CHECK (ECTS > 0));


INSERT INTO przedmioty(ID_Przedmiotu, nazwa, opis)  VALUES (
   1, 'Podstawy technik informatycznych',
   'Przedmiot ten sprawdza znajomość podtaw i pojęć z zakresu użytkowania komputerów.' );
INSERT INTO przedmioty(ID_Przedmiotu, nazwa, opis)  VALUES (
   2, 'Systemy wbudowane', 'Celem tego przedmiotu jest sprawdzenie wiedzy na temat pracy systemów wbudowanych stosowanych w przemyśle i bankowości.');
INSERT INTO przedmioty(ID_Przedmiotu, nazwa, opis)  VALUES (
   3, 'Edytory tekstów', 'Przedmiot ten sprawdza umiejętność przetwarzania tekstu. Jest przeznaczony do oceny umiejętności korzystania z edytora tekstu w celu tworzenia dokumentów.');
INSERT INTO przedmioty(ID_Przedmiotu, nazwa, opis)  VALUES (
   4, 'Arkusze kalkulacyjne', 'Przedmiot ten weryfikuje doświadczenie w projektowaniu i stosowaniu arkusza oraz znajomość jego podstawowych funkcji.');
INSERT INTO przedmioty(ID_Przedmiotu, nazwa, opis)  VALUES (
   5, 'Bazy danych', 'Przedmiot ten sprawdza umiejętności tworzenia małej bazy danych przy użyciu standardowego pakietu bazy danych oraz tworzenia prostych zapytań i raportów z istniejącej bazy danych.');
INSERT INTO przedmioty(ID_Przedmiotu, nazwa, opis)  VALUES (
   6, 'Grafika komputerowa', 'Przedmiot ten sprawdza umiejętność używania narzędzi do tworzenia prezentacji multimedialnych oraz prostej grafiki.');
INSERT INTO przedmioty(ID_Przedmiotu, nazwa, opis)  VALUES (
   7, 'Usługi w sieciach rozległych', 'Przedmiot ten sprawdza znajomość pojęć sieciowych, umiejętność korzystania z poczty elektronicznej i wiedzę o tym, co jest dostępne w sieciowych serwisach informacyjnych.');
COMMIT;

DROP TABLE if exists zaliczenia cascade ;
CREATE TABLE zaliczenia
(nr_zal			INT(7) NOT NULL,
 ID_Studenta		VARCHAR(7) NOT NULL,
 ID_Przedmiotu		INT(1) NOT NULL,
 ID_WYKLADOWCY		VARCHAR(4) NOT NULL,
 Data_zal			DATE,
 ID_Kierunku			INT(2) NOT NULL,
 Wynik			VARCHAR(10),
   CONSTRAINT nr_zal_pk PRIMARY KEY (nr_zal));


INSERT INTO zaliczenia VALUES (
  1, '1600049', 1, '0004', '06-01-05', 1, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
  2, '1700050', 1, '0004', '06-01-12', 1, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
  3, '1600049', 2, '0004', '06-01-02', 1, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
  4, '1700050', 2, '0004', '06-01-12', 1, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
  5, '1800060', 1, '0001', '10-02-20', 2, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
  6, '1700061', 1, '0002', '10-02-10', 2, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
  7, '1600049', 3, '0005', '09-04-19', 3, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
  8, '1700050', 3, '0009', '09-04-20', 2, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
  9, '1800060', 2, '0006', '09-04-27', 4, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 10, '1800060', 3, '0006', '09-05-04', 4, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 11, '1700061', 2, '0004', '09-05-07', 1, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 12, '1700061', 3, '0001', '09-05-10', 2, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 13, '1600049', 4, '0004', '09-02-20', 1, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 14, '1700050', 4, '0002', '10-02-20', 1, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 15, '1600049', 5, '0008', '09-03-30', 8, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 16, '1700050', 5, '0003', '09-03-10', 2, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 17, '1800060', 4, '0009', '10-03-11', 6, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 18, '1700061', 5, '0001', '10-03-11', 8, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 19, '1600049', 6, '0007', '09-04-26', 3, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 20, '1800060', 5, '0007', '09-04-27', 4, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 21, '1700050', 6, '0004', '09-04-30', 4, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 22, '1800060', 7, '0006', '09-04-07', 5, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 23, '1700061', 6, '0002', '08-04-23', 5, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 24, '1600049', 7, '0036', '08-05-07', 9, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 25, '1700050', 7, '0036', '08-05-09', 9, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 26, '1800060', 6, '0002', '10-05-16', 1, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 27, '1700061', 4, '0007', '10-05-28', 2, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 28, '1700061', 7, '0003', '10-05-10', 2, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 29, '1600062', 1, '0001', '10-05-21', 2, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 30, '1600062', 2, '0002', '09-07-10', 3, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 31, '1700063', 7, '0009', '08-03-21', 2, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 32, '1600062', 3, '0003', '08-09-01', 9, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 33, '1700063', 6, '0006', '08-09-02', 5, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 35, '1700063', 5, '0006', '09-05-31', 9, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 36, '1700063', 2, '0005', '08-06-10', 2, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 37, '1600062', 5, '0006', '10-06-10', 2, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 38, '1600062', 4, '0004', '08-07-01', 10, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 39, '1700063', 3, '0003', '08-07-04', 4, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 40, '1700063', 4, '0004', '21-04-09', 10, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 41, '1700063', 1, '0002', '10-07-01', 1, 'Negatywny');
INSERT INTO zaliczenia VALUES (
 42, '1600062', 6, '0007', '10-07-02', 4, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 43, '1600062', 7, '0008', '08-09-03', 1, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 44, '1700063', 1, '0002', '10-07-01', 1, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 45, '1700324', 1, '0001', '10-09-20', 1, 'Negatywny');
INSERT INTO zaliczenia VALUES (
 46, '1800323', 2, '0003', '10-09-10', 1, 'Negatywny');
INSERT INTO zaliczenia VALUES (
 47, '1700324', 2, '0003', '09-09-09', 1, 'Negatywny');
INSERT INTO zaliczenia VALUES (
 48, '1700324', 1, '0006', '09-09-11', 1, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 49, '1800323', 1, '0006', '04-09-12', 1, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 50, '1800323', 2, '0004', '09-09-24', 1, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 51, '1700324', 2, '0004', '06-09-10', 1, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 52, '1800323', 3, '0008', '06-10-01', 10, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 53, '1800323', 4, '0009', '06-09-28', 9, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 54, '1700324', 3, '0008', '08-09-30', 10, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 55, '1700324', 4, '0009', '08-09-14', 8, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 56, '1800323', 5, '0008', '08-11-10', 6, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 57, '1800323', 7, '0009', '09-10-30', 4, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 58, '1700324', 5, '0008', '09-10-20', 5, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 59, '1800323', 6, '0009', '09-10-10', 9, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 60, '1700324', 7, '0009', '09-10-18', 6, 'Zaliczony');
INSERT INTO zaliczenia VALUES (
 61, '1700324', 6, '0008', '09-10-19', 9, 'Negatywny');
INSERT INTO zaliczenia VALUES (
 62, '1700324', 4, '0009', '09-10-21', 1, 'Zaliczony');
 

-- Add foreign key constraints.

ALTER TABLE zaliczenia
   ADD CONSTRAINT id_st_fk
   FOREIGN KEY (ID_Studenta) REFERENCES STUDENCI (ID_Studenta);
ALTER TABLE zaliczenia
   ADD CONSTRAINT id_prz_fk
   FOREIGN KEY (ID_Przedmiotu) REFERENCES przedmioty (ID_Przedmiotu);
ALTER TABLE zaliczenia
   ADD CONSTRAINT id_wyk_fk
   FOREIGN KEY (ID_WYKLADOWCY) REFERENCES WYKLADOWCY (ID_WYKLADOWCY);
ALTER TABLE zaliczenia
   ADD CONSTRAINT id_k_fk
   FOREIGN KEY (ID_Kierunku) REFERENCES kierunki (ID_Kierunku);
   
-- Tables and sequences created and populated.

