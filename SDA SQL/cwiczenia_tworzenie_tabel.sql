-- ------------------------- Tworzenie tabel -------------------------
-- Na podstawie prezentacji (s 1-24) stwórz model bazy danych dla Księgarni 
-- Napisz skrypt do stworzenia 3 tabel: autorzy, książki, wydawnictwa z min. 3 polami w każdej uwzględniając pola dla kluczy obcych
-- oraz załóż klauzule NOT NULL na odpowiednie pola. Dodaj zabezpieczenie, w przypadku istnienia w bazie takiej tabeli.
-- Połącz odpowienidnie tabele relacjami klucz główny - klucz obcy pamiętając, że dane w polach połączonych polach powinny być koherentne.

CREATE TABLE IF NOT EXISTS autorzy (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE,
    imie VARCHAR(128) NOT NULL,
    nazwisko VARCHAR(128) NOT NULL
    );
CREATE TABLE IF NOT EXISTS wydawnictwa(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE,
    nazwa VARCHAR(128) UNIQUE
	);
CREATE TABLE IF NOT EXISTS ksiazki(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE,
    tytul VARCHAR(128) NOT NULL,
    autor VARCHAR(128) ,
    autor_id INT,
    wydawnictwo VARCHAR(128) ,
    FOREIGN KEY fk_autor_id(autor_id) REFERENCES autorzy(id) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY fk_wydawnictwo(wydawnictwo) REFERENCES wydawnictwa(nazwa) ON UPDATE CASCADE ON DELETE SET NULL
	);

-- Utwórz przynajmniej po jednym rekordzie w każdej z tabel.    
INSERT INTO autorzy (imie,nazwisko) VALUES('Andrzej','Sapkowski');
INSERT INTO wydawnictwa(nazwa) VALUES('Supernowa');
INSERT INTO ksiazki(tytul,autor_id,wydawnictwo) VALUES('Wiedźmin',1,'Supernowa');

 

-- Na podstawie wykonanego modelu wygeneruj diagram ERD.
-- Stwórz zapytanie, w którym wypiszesz Tytuł książki, autora i wydawnictwo.
SELECT k.tytul,CONCAT_WS(' ',a.imie,a.nazwisko) AS nazwisko, wydawnictwo FROM ksiazki k JOIN autorzy a ON k.autor_id = a.id; 

