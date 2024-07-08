/*
 TEMPLATE CREAZIONE NUOVA TABELLA
 Sostituire xxx con il nome del tracciato che si vuole gestire
 I nomi di colonne colonna1, colonna2, ecc... sono solo esemplificativi
*/
CREATE TABLE ft_xxx(
    id_xxx SERIAL NOT NULL, 
    colonna1 VARCHAR(255),
    colonna2 INTEGER,
    colonna3 DECIMAL(10,2)
	dt_update timestamp DEFAULT now(), /*consiglio sempre di predisporre una colonna per registrate il timestamp di quando il record viene inserito/modificato*/
    CONSTRAINT const_ft_xxx_pk PRIMARY KEY (id_xxx) /*quì dichiaro la primary key*/
    /*
	Quì dichiaro le foreign_key nel caso ci siano:
	,CONSTRAINT const_ft_xxx_fk1 FOREIGN KEY (id_yyy)  REFERENCES ft_yyy(id_yyy),
    CONSTRAINT const_ft_zzz_fk2 FOREIGN KEY (id_zzz)  REFERENCES ft_zzz(id_zzz)
	*/
);	


/*
 TEMPLATE CREAZIONE NUOVA VISTA
 Il nome view_clienti_impiegati è solo di esempio e deve essere personalizzato,
 così come tutta la select che proietta il risultato.
*/
CREATE VIEW view_clienti_impiegato AS
	SELECT
		cli.nome,
		cli.cognome,
		cli.indirizzo 
	FROM
		ft_cliente as cli 
	where 
		cli.professione = 'Impiegato'
	;
	