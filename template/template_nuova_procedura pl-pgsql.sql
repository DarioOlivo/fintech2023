CREATE OR REPLACE PROCEDURE public.nome_procedura(par_1 integer)
 LANGUAGE plpgsql
AS $$
/*
 QUESTO E' UN TEMPLATE per creare una nuova procedura in postgresql.
 l'esempio quì riportato ipotizza di creare una procedura chiamata: "nome_procedura" che accetta in entrata un valore passato
 come parametro "par_1" di tipo "integer".
 
 P.S. Ricorda che la differenza tra una funzione e una procedura consiste nel fatto che una 
 funzione gestisce sempre un "valore di ritorno", mentre una procedura non prevede nessun valore di ritorno.
*/
declare
	-- dichiarazione delle variabili
	ris integer;
begin
	/* contenuto della procedura
	 Questa riga di codice è solo da esempio, voi la sostituirete con il codice che vorrete eseguire
	*/
	ris := 10;
exception
	when others then 
		begin
			ris := 11;
			/* la seguente riga è commentata ma se la scommento propago l’errore alla funzione chiamante*/
			/*RAISE EXCEPTION '% %',sqlstate,sqlerrm; */

			/*la seguente riga di codice scrive l'errore nella tabella di log: ft_monitoraggio_log/
			/*call scrivi_log('roi_kpi_valori_medi', 'Errore codice: '|| sqlstate || ' descrizione: ' || sqlerrm, 'ERRORE');*/
		end;
end; 
$$
;
