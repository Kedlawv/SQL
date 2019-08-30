-- ************************* Sekcja create *************************
-- ------------------------- Tworzenie bazy -------------------------
-- Proszę utworzyć bazę 'księgarnia'
CREATE DATABASE IF NOT EXISTS ksiegarnia CHARACTER SET UTF8MB4 COLLATE UTF8MB4_POLISH_CI; 
-- ------------------------- Tworzenie użytkownika -------------------------
-- Proszę utworzyć 3 użytkowników 'user1a','user2b','user3c' z hasłem 'abc123'
CREATE USER user1a@localhost IDENTIFIED BY 'abc123';
CREATE USER user2b@localhost IDENTIFIED BY 'abc123';
CREATE USER user3c@localhost IDENTIFIED BY 'abc123';
SHOW GRANTS FOR user1a@localhost;
-- Nadaj uprawnienia do wykonywania operacji SELECT, CREATE, ALTER, REFERENCES każdemu z nich
GRANT SELECT,CREATE,ALTER,REFERENCES ON ksiegarnia.* TO user1a@localhost; 
GRANT SELECT,CREATE,ALTER,REFERENCES ON ksiegarnia.* TO user2b@localhost;
GRANT SELECT,CREATE,ALTER,REFERENCES ON ksiegarnia.* TO user3c@localhost;
-- Proszę utworzyć nową instancję dla stworzonego użytkownika 'user1a' i zalogować się do niej i wybrać domyślną bazę 'księgarnia'
-- Proszę przelączyć się na root i z tego poziomu zmienić uprawnienia dla 'user1a' i dać mu wszystkie uprawnienia do schemy 'księgarnia'.
GRANT ALL ON ksiegarnia.* TO user1a@localhost;
SHOW GRANTS FOR user1a@localhost; 
-- Proszę zmienić uprawnienia 'user2b' tak by mógł wykonywać jedynie operacje typu SELECT.
SHOW GRANTS FOR user2b@localhost;
REVOKE ALL PRIVILEGES,GRANT OPTION FROM user2b@localhost;
GRANT SELECT ON ksiegarnia.* TO user2b@localhost;
-- Proszę usunąć user3c.
DROP USER user3c@localhost;
SELECT user, host FROM mysql.user;
-- ------------------------- Tworzenie tabel -------------------------
-- Na podstawie prezentacji (s 1-24) stwórz model bazy danych dla Księgarni 
-- Napisz skrypt do stworzenia 3 tabel: autorzy, książki, wydawnictwa z min. 3 polami w każdej uwzględniając pola dla kluczy obcych
--   oraz załóż klauzule NOT NULL na odpowiednie pola. Dodaj zabezpieczenie, w przypadku istnienia w bazie takiej tabeli. 
-- Utwórz przynajmniej po jednym rekordzie w każdej z tabel.
-- Połącz odpowienidnie tabele relacjami klucz główny - klucz obcy pamiętając, że dane w polach połączonych polach powinny być koherentne.
-- Na podstawie wykonanego modelu wygeneruj diagram ERD.
-- Stwórz zapytanie, w którym wypiszesz Tytuł książki, autora i wydawnictwo.
-- ************************* Sekcja Query *************************
-- ------------------------- Tworzenie zapytań -------------------------
-- POZIOM I
-- 1. Wybierz wszystkie informacje z tabeli Student za wyjątkiem tel. i maila.
-- 2. Wypisz bez powtórzeń miasta, których pochodzą Wykładowcy.
-- 3. Policz ile jest zaliczeń z wynikiem pozytywnym.
-- 4. Wypisz dane studentów w nastepujący sposób: I kolumna (imie, nazwisko), II kolumna (dane adresowe potrzebne do nadania paczki)
-- 5. Wybierz wykładowców z nazwiskiem na literę K spoza Rzeszowa.
-- 6. Wyświetl przedmioty dla których liczba punktów ECTS jest niższa od średniej dla wszystkich kierunków.
-- 7. Wyświetl ilość zaliczeń z każdego kierunku i posortuj wyniki malejąco po tej liczbie.
;