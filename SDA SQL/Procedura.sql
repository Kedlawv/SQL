delimiter//
create procedure SET_DISCOUNT(IN discount float ,IN isbn varchar(128))
begin
	update ksiazki set cena = ROUND(cena - cena * discount / 100) where k.isbn = isbn 
end//
delimiter ;