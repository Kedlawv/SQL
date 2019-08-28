-- 4. Wyświetl w jednej kolumnie imię i nazwisko studenta oddzielone spacją, drugiej jego dane
-- teleadresowe oddzielone plusem

SELECT 
	CONCAT_WS(' ', Imie, Nazwisko) AS Imie,
    CONCAT_WS('+', Ulica, Numer, Miejsce, Miasto, Kod, Tel) AS Informacje_Kontaktowe
FROM studenci;

-- 6. Wypisz imie, nazwisko i adres studenta pochodzącego i mieszkającego w Rzeszowie.

SELECT imie, nazwisko, ulica, numer, miasto, kod, Miejsce AS Miejsce_ur
FROM studenci
WHERE Miejsce = 'Rzeszów' AND Miasto = 'Rzeszów';

-- 7. Wypisz informacje o wykładowców, którzy nie mają na nazwisko Kowalski.

SELECT *
FROM wykladowcy
WHERE Nazwisko != 'Kowalski';

-- 8. Policz ilu Kowalskich jest wśród wykładowców.

SELECT COUNT(Nazwisko) AS Liczba_Kowalskich
FROM Wykladowcy
WHERE Nazwisko = 'Kowalski';

-- 9. Wypisz na dwa sposoby adresy mailowe wykładowców o nazwisku 'Mila' i 'Kowalski'

SELECT E_mail 
FROM wykladowcy
WHERE nazwisko = 'Mila' OR nazwisko = 'Kowalski';

SELECT E_mail 
FROM wykladowcy
WHERE nazwisko IN('Mila','Kowalski');

-- 10. Wypisz dane studentów, których nazwisko zaczyna się na literę 'M';
SELECT *
FROM studenci
WHERE nazwisko LIKE 'M%';

-- 11. Wypisz dane wykładowcy, których nazwisko zaczyna się na literę 'D' i pochodzą z Rzeszowa; 
SELECT *
FROM wykladowcy
WHERE nazwisko LIKE 'D%' AND Miasto = 'Rzeszów';

-- 12. Wypisz na trzy sposoby (korzystając z dwóch operatorów logicznych oraz funkcji LIKE)
-- kody pocztowe studentów spoza Rzeszowa.

SELECT *
FROM studenci
WHERE miasto != 'Rzeszów';

SELECT *
FROM studenci
WHERE miasto <> 'Rzeszów';

SELECT *
FROM studenci
WHERE miasto NOT LIKE 'Rzeszów';

-- 13. Wypisz nazwy kierunków i ich punkty ects i posortuj wyniki malejąco po ich liczbie.
SELECT nazwa, S_ECTS 
FROM kierunki
ORDER BY S_ECTS DESC;

-- 14. Wypisz informacje na temat miejsca urodzenia studentów tak by wyniki nie powtarzały się.
-- (wartości unikalne)

SELECT DISTINCT miejsce 
FROM studenci;

-- 15. Wypisz w jednej tabeli nazwisko, imię, miasto z którego pochodzą studenci i wykładowcy.

SELECT nazwisko, imie, miasto 
FROM studenci

UNION

SELECT nazwisko, imie, miasto
FROM wykladowcy; 

-- 16. Wypisz unikalne wartości dla pola miasto z którego pochodzą studenci i wykładowcy
SELECT DISTINCT miasto
FROM studenci

UNION

SELECT DISTINCT miasto
FROM wykladowcy;

-- 17. Wypisz te same dane co w zadaniu 15 ale dopisz informacje czy osoba
-- jest studentem czy wykładowcą

SELECT nazwisko, imie, miasto, 'Student' AS funkcja 
FROM studenci

UNION

SELECT nazwisko, imie, miasto, 'Wykladowca' AS funkcja
FROM wykladowcy; 

-- 18. Wypisz studentów, którzy nie posiadają numeru telefonu.

SELECT * 
FROM studenci
WHERE tel IS NULL;

-- 19. Policz ilu jest studentów.

SELECT COUNT(ID_Studenta)
FROM STUDENCI;

-- 20. Policz ilu jest studentów zliczając po kolumnie (Tel). Jaką widzisz różnice w porównaniu 
-- do wyników z zad. 19 o czym to świadczy ?

SELECT COUNT(tel)
FROM studenci;

-- 21. Policz minimalną, maksymalną oraz średnia liczbę punktów ects w tabeli kierunki.

SELECT 
	MIN(S_ECTS) AS Min,
    MAX(S_ECTS) AS Max,
    AVG(S_ECTS) AS Avg
FROM kierunki;

-- 22. Wyświetl dane studentów, którzy nie przystąpili jeszcze do egzaminów.
-- (skorzystaj z podzapytania w sekcji WHERE) (edited) 

SELECT *
FROM studenci
WHERE studenci.ID_Studenta NOT IN(SELECT ID_Studenta FROM zaliczenia);

-- 23. Wyświetl imie, nazwisko, PESEL oraz ilość egzaminów do których przystąpił każdy student.
-- (skorzystaj z podzapytania w sekcji SELECT) (edited) 

SELECT Imie, Nazwisko, PESEL,
 (SELECT COUNT(z.ID_Studenta) FROM zaliczenia z WHERE s.ID_Studenta = z.ID_studenta)
 AS Ilosc_egzaminow 
FROM studenci s;

-- 24. Dodaj nowego studenta uzupełniając wszystkie dane.
INSERT INTO studenci
VALUES(
	'1800328', 
    'Jan', 
    'Kowalski', 
    '1989-01-01', 
    'Tarnobrzeg', 
    '89060686472', 
    '32-567', 
    'Rzeszów', 
    'Lubelska', 
    23, 
    '846300136', 
    'JanKow@gmail.com');

-- 25. Dodaj kolejnych dwóch studentów używając jednego zapytania postaraj się by każdy z nich miał
--     inną datę urodzenia. (edited) 
-- 26. Usuń najmłodszego z 3 dodanych studentów.
-- 27. Dla nowo dodanych studentów zmodyfikuj wartość pola Miejsce na 'Opole';
-- 28. Utwórz kopię tabeli Studentów o nazwie Studenci_BKP.
-- 29. Utwórz tabelę Studenci_RZE z takimi samymi polami jak tabela Studenci za wyjątkiem pola
--     Miasto (edited) 
-- 30. Wypełnij tabelę Studenci_RZE danymi z tabeli Studenci wybierając tylko tych, którzy 
--     pochodzą z Rzeszowa

-- 31. Wyświetl ilość zaliczeń z każdego kierunku korzystając z funkcji grupowania.
SELECT ID_Kierunku, COUNT(ID_Kierunku) 
FROM zaliczenia
WHERE wynik = 'zaliczony' 
GROUP BY ID_Kierunku

-- 32. Wyświetl ID_studenta który nie zaliczył egzaminów więcej niż raz korzystając z GROUP BY
-- i HAVING (edited)  










