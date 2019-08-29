-- 1. Zwróć wszystkie dane z tabeli studenci
SELECT * FROM studenci;
-- 2. Zwróć imię, nazwisko i mail wykładowcy
SELECT Imie, Nazwisko, E_mail FROM wykladowcy;
-- 3. Wyświetl wszystkie dane z tabeli przedmioty za wyjątkiem pola Opis
SELECT ID_Przedmiotu, nazwa, rodzaj, ECTS FROM przedmioty;
-- 4. Wyświetl w jednej kolumnie imię i nazwisko studenta oddzielone spacją, drugiej jego dane teleadresowe oddzielone plusem
SELECT CONCAT_WS(' ',Imie,Nazwisko) AS Imie, CONCAT_WS('+',ulica,numer,miasto) AS adres FROM studenci;
-- hint 4. -- użyj aliasu do utworzenia nowych kolumn oraz funkcja bazodanowej do łączenia ciągów znaków
-- 5. Wypisz wszystkie informacje na temat wykładowców z Rzeszowa (edited) 
SELECT * FROM wykladowcy WHERE Miasto = 'Rzeszów';
-- 6. Wypisz imie, nazwisko i adres studenta pochodzącego i mieszkającego w Rzeszowie.
SELECT * FROM studenci WHERE Miejsce = 'Rzeszów' AND Miasto = 'Rzeszów';
-- 7. Wypisz informacje na temat wykładowców, którzy nie mają na nazwisko Kowalski. (edited) 
SELECT * FROM wykladowcy WHERE Nazwisko != 'Kowalski';    
-- 8. Policz ilu Kowalskich jest wśród wykładowców.
SELECT COUNT(*) FROM wykladowcy WHERE nazwisko = 'Kowalski';
SELECT COUNT(IF(nazwisko = 'kowalski', 1, NULL)) AS if_kowalski FROM wykladowcy;    
-- 9. Wypisz na dwa sposoby adresy mailowe wykładowców o nazwisku 'Mila' i 'Kowalski'
SELECT E_mail FROM wykladowcy WHERE Nazwisko = 'Mila' OR Nazwisko = 'Kowalski';
SELECT E_mail FROM wykladowcy WHERE Nazwisko IN('Mila','Kowalski') ;
-- hint 9 -- skorzystaj z operatora OR oraz funkcji IN (edited) 
-- 10. Wypisz dane studentów, których nazwisko zaczyna się na literę 'M';
SELECT * FROM studenci WHERE Nazwisko LIKE 'M%'; 
-- 11. Wypisz dane wykładowcy, których nazwisko zaczyna się na literę 'D' i pochodzą z Rzeszowa; (edited) 
SELECT * FROM wykladowcy WHERE Nazwisko LIKE 'D%' AND Miasto = 'Rzeszów';
-- 12. Wypisz na trzy sposoby (korzystając z dwóch operatorów logicznych oraz funkcji LIKE) kody pocztowe studentów spoza Rzeszowa.
SELECT * FROM studenci WHERE Miasto != 'Rzeszów';
SELECT * FROM studenci WHERE Miasto <> 'Rzeszów';
SELECT * FROM studenci WHERE Miasto NOT LIKE 'Rzeszów';
-- 13. Wypisz nazwy kierunków i ich punkty ects i posortuj wyniki malejąco po ich liczbie.
SELECT nazwa, S_ECTS FROM kierunki ORDER BY S_ECTS DESC;
-- 14. Wypisz informacje na temat miejsca urodzenia studentów tak by wyniki nie powtarzały się. (wartości unikalne)
SELECT DISTINCT Miejsce FROM studenci ; 
-- 14.b Wypisz miejsce urodzenia studentów policz i pogrupój według miasta.ALTER
SELECT miejsce, COUNT(*) AS n_studentów FROM studenci GROUP BY miejsce;
-- 15. Wypisz w jednej tabeli nazwisko, imię, miasto z którego pochodzą studenci i wykładowcy (ERROR: wykladowcy nie maja columny 'miejsce ur'.
SELECT nazwisko, imie, miasto, 'student' FROM studenci 
UNION 
SELECT nazwisko, imie, miasto, 'wykladowca' FROM wykladowcy;


-- 16. Wypisz unikalne wartości dla pola miasto w ktorym zamieszkuja studenci i wykładowcy
SELECT DISTINCT miasto FROM studenci 
UNION 
SELECT DISTINCT miasto FROM wykladowcy;
-- 16.b Policz ilosc wszystkich uniklanych miast w ktorych mieszkaja studenci i wykladowcy
SELECT 
    COUNT(*) AS n_miast
FROM
	(SELECT miasto FROM studenci 
	UNION 
	SELECT miasto FROM wykladowcy) AS miasto
    ;
    
-- 17. Wypisz te same dane co w zadaniu 15 ale dopisz informacje czy osoba jest studentem czy wykładowcą
SELECT nazwisko, imie, miasto, 'student' FROM studenci 
UNION 
SELECT nazwisko, imie, miasto, 'wykladowca' FROM wykladowcy;
-- 18. Wypisz studentów, którzy nie posiadają numeru telefonu.
SELECT * FROM studenci WHERE tel IS NULL;
-- 19. Policz ilu jest studentów.
SELECT COUNT(*) AS n_studentow FROM studenci;
-- 20. Policz ilu jest studentów zliczając po kolumnie (Tel). Jaką widzisz różnice w porównaniu do wyników z zad. 19 o czym to świadczy ?
-- note the * operator in the count function counts null values
SELECT COUNT(tel) AS n_studentow FROM studenci;
-- 21. Policz minimalną, maksymalną oraz średnia liczbę punktów ects w tabeli kierunki. (edited) 
SELECT MIN(S_ECTS) AS min, MAX(S_ECTS) AS max, AVG(S_ECTS) AS avg FROM kierunki;
-- 22. Wyświetl dane studentów, którzy nie przystąpili jeszcze do egzaminów. (skorzystaj z podzapytania w sekcji WHERE) (edited) 
SELECT * FROM studenci s WHERE s.ID_Studenta NOT IN(SELECT ID_Studenta FROM zaliczenia);
-- 23. Wyświetl imie, nazwisko, PESEL oraz ilość egzaminów do których przystąpił każdy student.  (skorzystaj z podzapytania w sekcji SELECT) (edited) 
-- using subquery
SELECT ID_Studenta, imie, Nazwisko, PESEL, (SELECT COUNT(*) FROM zaliczenia z WHERE z.ID_Studenta = s.ID_Studenta ) AS n_zaliczen FROM studenci s;
-- using join and if
SELECT s.ID_Studenta, s.Imie, s.Nazwisko, s.PESEL, COUNT(IF(z.wynik IS NOT NULL,1,NULL)) AS n_zaliczen FROM studenci s 
	LEFT JOIN zaliczenia z ON z.ID_Studenta = s.ID_Studenta GROUP BY ID_Studenta ;
-- 23.b Tak jak w 23 ale zamiast przystąpien do egzaminów wypisz ilość zaliczen i oblań
SELECT s.ID_Studenta, s.Imie, s.Nazwisko, s.PESEL, COUNT(IF(z.wynik = 'Zaliczony',1,NULL)) AS Zaliczone, COUNT(IF(z.wynik = 'Negatywny',1,NULL)) AS Oblane
	FROM studenci s 
	LEFT JOIN zaliczenia z ON z.ID_Studenta = s.ID_Studenta GROUP BY ID_Studenta ;
-- 24. Dodaj nowego studenta uzupełniając wszystkie dane.

-- 25. Dodaj kolejnych dwóch studentów używając jednego zapytania postaraj się by każdy z nich miał inną datę urodzenia. (edited) 
-- 26. Usuń najmłodszego z 3 dodanych studentów.
-- 27. Dla nowo dodanych studentów zmodyfikuj wartość pola Miejsce na 'Opole';
-- 28. Utwórz kopię tabeli Studentów o nazwie Studenci_BKP.
-- 29. Utwórz tabelę Studenci_RZE z takimi samymi polami jak tabela Studenci za wyjątkiem pola Miasto (edited) 
-- 30. Wypełnij tabelę Studenci_RZE danymi z tabeli Studenci wybierając tylko tych, którzy pochodzą z Rzeszowa
-- 31. Wyświetl ilość zaliczeń z każdego kierunku korzystając z funkcji grupowania.
-- 32. Wyświetl ID_studenta który nie zaliczył egzaminów więcej niż raz korzystając z GROUP BY  i HAVING
;
​