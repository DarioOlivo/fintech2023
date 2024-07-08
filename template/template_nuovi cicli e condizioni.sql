/*
 ********************************************************************************
 ********************************************************************************
 **                           ROI PROJECT
 **             TEMPLATE CREAZIONE NUOVI CICLI E CONDIZIONI
 **  Questo template serve per prendere da esempio la sintassi per scrivere
 ** cicli e condizioni all'interno delle vostre procedure/funzioni postgresql.
 ********************************************************************************
 ********************************************************************************
*/


/*
 ---------------------------------------------------------------------------------
 Condizione: IF
 --------------------------------------------------------------------------------- 
*/
/*vericico la condizione ed eseguo il codice contenuto solo se la condizione_1 restituisce TRUE*/
if condizione_1 then
	riga_di_codice;
	riga_di_codice;
end if;

/*
 ---------------------------------------------------------------------------------
 Condizione: IF ELSIF ELSE
 ---------------------------------------------------------------------------------
*/
/*vericico la prima condizione*/
IF condizione_1 THEN
	riga_di_codice;  /*viene eseguito solo se la condizione_1 restituisce true*/
	riga_di_codice;  /*viene eseguito solo se la condizione_1 restituisce true*/
	...
/*vericico la seconda condizione*/
ELSIF condizione_2 THEN
	riga_di_codice;  /*viene eseguito solo se la condizione_2 restituisce true*/
	riga_di_codice;  /*viene eseguito solo se la condizione_2 restituisce true*/
	...
/*vericico la N° condizione*/
ELSIF condizione_n THEN
	riga_di_codice;  /*viene eseguito solo se la condizione_n restituisce true*/
	riga_di_codice;  /*viene eseguito solo se la condizione_n restituisce true*/
	...
/*in tutti gli altri casi*/	
ELSE
	riga_di_codice;  /*viene eseguita solo se tutte le precedenti condizioni restituiscono FALSE*/
	riga_di_codice;  /*viene eseguita solo se tutte le precedenti condizioni restituiscono FALSE*/
	...
END IF;

/*
 ----------------------------------------
 ESEMPIO PRATICO
 P.S. i comandi DO$$ e END$$ servono per racchiudere al loro interno 
 un codice procedurale che possa essere eseguito da una finestra SQL 
 evitando così di dover creare una procedura dedicata
 ----------------------------------------
*/
DO $$
DECLARE
	valore_1 INTEGER := 33;
	valore_2 INTEGER := 40;
BEGIN
	IF valore_1 < valore_2 THEN
		RAISE NOTICE 'valore_1 è minore di valore_2';
	ELSIF valore_1 > valore_2 THEN
		RAISE NOTICE 'valore_1 è maggiore di valore_2';
	ELSE
		RAISE NOTICE 'valore_1 è uguale a valore_2';
	END IF;
END $$;


/*
 ---------------------------------------------------------------------------------
 Ciclo FOR LOOP
 Il ciclo FOR LOOP mi permette di ciclare i risultati di una select 
 per leggere i record uno alla volta ed eseguire eventuali istruzioni.

 P.S. i comandi DO$$ e END$$ servono per racchiudere al loro interno 
 un codice procedurale che possa essere eseguito da una finestra SQL 
 evitando così di dover creare una procedura dedicata
 ---------------------------------------------------------------------------------
*/
DO $$
DECLARE
	/*dichiaro una variabile di tipo "record" */
	v_record record;
BEGIN	
	/*Catturo i record del recordset restituito dalla select e li ciclo uno per volta*/
	FOR v_record IN 
    	SELECT 
     		cli.*
		FROM 
			ft_cliente as cli
	loop
		/*inserisco il cognome del cliente nella tabella di log, usando la sintassi: v_record.nome_colonna*/
		insert into ft_log_monitoraggio(tracciato,testo) 
			values ('test1',v_record.cognome);
	END LOOP;
END $$;
