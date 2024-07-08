CREATE OR REPLACE FUNCTION public.nome_funzione(par_1 integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $$
/*
 QUESTO E' UN TEMPLATE per creare una nuova funzione in postgresql.
 l'esempio quì riportato ipotizza di creare una funzione chiamata: "nome_funzione" che accetta in entrata un valore passato
 come parametro "par_1" di tipo "integer" e restituisce un valore di ritorno di tipo "integer".
 
 P.S. Ricorda che la differenza tra una funzione e una procedura consiste nel fatto che una 
 funzione gestisce sempre un "valore di ritorno", mentre una procedura non prevede nessun valore di ritorno.
*/
declare
	-- dichiarazione delle variabili
	ris integer;
begin
	/* contenuto della funzione
	 valorizzo la variabile di ritorno con il valore passato come parametro
	 Questa riga di codice è solo da esempio, voi la sostituirete con il codice che vorrete eseguire
	*/
	ris := par_1;

	--restituzione del valore di ritorno
	return ris;
exception
	when others then 
		begin
			return ris;
			/* la seguente riga è commentata ma se la scommento propago l’errore alla funzione chiamante*/
			/*RAISE EXCEPTION '% %',sqlstate,sqlerrm; */
		end;
end; 
$$
;