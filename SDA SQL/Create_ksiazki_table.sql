CREATE TABLE ksiazki (
	tytul VARCHAR(128) NOT NULL,
    author VARCHAR(128) NOT NULL,
    data_publikacji DATE,
    isbn VARCHAR(17) NOT NULL,
    kategoria VARCHAR(128),
    stron INT(5),
    wydawnictwo VARCHAR(128) DEFAULT 'nieznane',
    cena DECIMAL(7,2),
    ocena DECIMAL(2,1),
    stan_magazynowy INT(5) DEFAULT 0
    );


INSERT INTO ksiazki VALUES(
	'Spring w akcji',
    'Craig Walls',
    '2015-08-13',
    '978-83-283-0849-7',
    'programowanie java',
    '624',
    'Helion',
    '77.99',
    '4.5',
    '0'
    );
    
    INSERT INTO ksiazki VALUES(
	'MySQL Vademecum profesjonalisty',
    'Paul DuBois',
    '2014-03-28',
    '978-83-246-8146-4',
    'bazy danych',
    1216,
    'Helion',
    89.00,
    5.0,
    DEFAULT
    );