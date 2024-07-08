/*
 **************************************************************
 **************************************************************
 **                     ROI PROJECT
 **      funzioni più comunemente usate su postgresql
 **************************************************************
 **************************************************************
*/

/*
 **************************************************************
 **************************************************************
 **                 FUNZIONI SULLE STRINGHE
 **************************************************************
 **************************************************************
*/

/*
 --------------------------------------------------------------
 Trasforma il contento in MAIUSCOLO
 -------------------------------------------------------------- 
*/
select 
	UPPER(cli.email)
from 
	ft_cliente as cli
;	

/*
 --------------------------------------------------------------
 Trasforma il contento in minuscolo
 -------------------------------------------------------------- 
*/
select 
	LOWER(cli.email)
from 
	ft_cliente as cli
;	

/*
 --------------------------------------------------------------
 Prende le prime 3 lettere partendo da sinistra
 -------------------------------------------------------------- 
*/
select 
	LEFT(cli.email,3)
from 
	ft_cliente as cli
;	

/*
 --------------------------------------------------------------
 Prende le ultime 3 lettere partendo da destra
 -------------------------------------------------------------- 
*/
select 
	RIGHT(cli.email,3)
from 
	ft_cliente as cli
;	

/*
 --------------------------------------------------------------
 Prende una porzione di stringa a partire dal carattere 2 per 3 caratteri
 -------------------------------------------------------------- 
*/
select 
	SUBSTRING(cli.email from 2 for 3) as sub_2_3
from 
	ft_cliente as cli
;	

/*
 --------------------------------------------------------------
 Concatena più stringhe in una sola
 -------------------------------------------------------------- 
*/
select 
	cli.nome || cli.cognome || cli.indirizzo as nome_cognome_indirizzo
from 
	ft_cliente as cli
;	

/*
 --------------------------------------------------------------
 Conta la lunghezza di caratteri in una stringa
 -------------------------------------------------------------- 
*/
select 
	char_length(cli.email) as lunghezza_mail
from 
	ft_cliente as cli
;	

/*
 --------------------------------------------------------------
 Togle gli spazi vuoti a inizio e fine stringa
 -------------------------------------------------------------- 
*/
select 
	trim(cli.email) as email_trimmata
from 
	ft_cliente as cli
;	

/*
 **************************************************************
 **************************************************************
 **                 FUNZIONI SULLE DATE
 **************************************************************
 **************************************************************
*/

/*
 --------------------------------------------------------------
 Restituisce la data attuale
 -------------------------------------------------------------- 
*/
select 
	CURRENT_DATE as data_attuale
;	

/*
 --------------------------------------------------------------
 Restituisce l' anno estratto da un campo DATE oppure TIMESTAMP
 -------------------------------------------------------------- 
*/
select 
	EXTRACT(YEAR FROM cli.data_nascita) as anno
from
	ft_cliente as cli
;	

/*
 --------------------------------------------------------------
 Restituisce il mese estratto da un campo DATE oppure TIMESTAMP
 La parola chiave CURRENT_DATE può essere sostituita con il nome di una colonna 
 -------------------------------------------------------------- 
*/
select 
	EXTRACT(MONTH FROM cli.data_nascita) as mese
from
	ft_cliente as cli
;	

/*
 --------------------------------------------------------------
 Restituisce il giorno estratto da un campo DATE oppure TIMESTAMP
 La parola chiave CURRENT_DATE può essere sostituita con il nome di una colonna 
 -------------------------------------------------------------- 
*/
select 
	EXTRACT(DAY FROM cli.data_nascita) as giorno
from
	ft_cliente as cli
;	

/*
 --------------------------------------------------------------
 Restituisce la data e l'ora attuale
 -------------------------------------------------------------- 
*/
select 
	now() as timestamp_attuale
;	

/*
 --------------------------------------------------------------
 Restituisce la differenza tra due date
 (quando usate - o + con due campi DATA il risultato è in valore numerico intero espresso in numero di giorni)
 -------------------------------------------------------------- 
*/
select 
	cli.data_nascita - '1986-10-02' as diff_giorni
from
	ft_cliente as cli
;	

/*
 --------------------------------------------------------------
 Restituisce la differenza tra due timestamp
 quando usate - o + con due campi TIMESTAMP (ovvero data+ora) il risultato è espresso in data e ora
 -------------------------------------------------------------- 
*/
select 
	cli.dt_update - '1976-10-02 10:30:45' as diff_timestamp
from
	ft_cliente as cli
;	

/*
 --------------------------------------------------------------
 Aggiungere o togliere intervalli di tempo ad una DATA o un TIMESTAMP
 -------------------------------------------------------------- 
*/
select 
	cli.data_nascita + interval '1 day' as data_nascita_piu_1_giorno,
	cli.data_nascita - interval '1 month' as data_nascita_meno_1_mese,	
	cli.dt_update + interval '1 day' as data_ora_update_piu_1_giorno,
	cli.dt_update - interval '1 minute' as data_ora_update_meno_1_minuto
from
	ft_cliente as cli
;

/*
 --------------------------------------------------------------
 Restituisce la differenza tra due date espressa in ANNI, MESI e GIORNI
 quando usate - o + con due campi TIMESTAMP (ovvero data+ora) il risultato è espresso in data e ora
 -------------------------------------------------------------- 
*/
select 
	age(CURRENT_DATE,cli.data_nascita) as diff_anni_mesi_giorni
from
	ft_cliente as cli
;

/*
 --------------------------------------------------------------
 Estrapola gli ANNI (in formato numerico intero) dalla funzione AGE
 -------------------------------------------------------------- 
*/
select 
	date_part('year', age(CURRENT_DATE,cli.data_nascita)) as eta_attuale
from
	ft_cliente as cli
;

/*
 **************************************************************
 **************************************************************
 ** FORMATI CLASSICI DI TESTO CHE POSTGRESQL RIESCE A CONVERTIRE 
 **       IN DATA IN MODO IMPLICITO senza necessità 
 **           di applicare conversioni esplicite
 **************************************************************
 **************************************************************
*/
select 
	CURRENT_DATE - '2023-03-20' as differenza_giorni1, /*'YYYY-MM-DD'*/
	CURRENT_DATE - '2023/03/20' as differenza_giorni2 /*'YYYY/MM/DD'*/
;
