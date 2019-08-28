CREATE TABLE Osoby(
	id INT(10),
    imie VARCHAR(128),
    nazwisko VARCHAR(128),
    rola_id INT(10),
    CONSTRAINT PK_id PRIMARY KEY(id)
    );
    
CREATE TABLE Roles(
	id INT(10),
    nazwa VARCHAR(128),
    FOREIGN KEY(id) REFERENCES Osoby(id)
    ON DELETE CASCADE ON UPDATE CASCADE
    );
    
ALTER TABLE Roles ADD CONSTRAINT PK_id PRIMARY KEY(id);
ALTER TABLE osoby ADD CONSTRAINT FOREIGN KEY(rola_id) REFERENCES roles(id);

INSERT INTO roles 
VALUES(1,'Kierownik');


    
INSERT INTO Osoby
VALUES(1,'Jan','Kowalski',1);

DELETE FROM roles