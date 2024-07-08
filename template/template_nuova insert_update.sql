/*
 ********************************************************************************
 ********************************************************************************
 **                           ROI PROJECT
 **             TEMPLATE CREAZIONE NUOVE SELECT e UPDATE
 **  Questo template serve per prendere da esempio la sintassi per scrivere
 **  comdandi di INSERT e UPDATE.
 ********************************************************************************
 ********************************************************************************
*/


/*
 ---------------------------------------------------------------------------------
INSERT DI 1 RECORD CON VALORI FISSI
Le colonne da inserire tra le parentesi tonde sono a vostra discrezione
 --------------------------------------------------------------------------------- 
*/
INSERT INTO nome_tabella (colonna1, colonna2, colonna3) VALUES 
	('valore1', 'valore2', 'valore3');

/*
 ---------------------------------------------------------------------------------
INSERT DI PIU' RECORD CON VALORI FISSI
Le colonne da inserire tra le parentesi tonde sono a vostra discrezione
 --------------------------------------------------------------------------------- 
*/
INSERT INTO nome_tabella (colonna1, colonna2, colonna3) VALUES 
	('valore01', 'valore02', 'valore03'),
	('valore05', 'valore06', 'valore07'),
	('valore08', 'valore09', 'valore10'),
	('valore11', 'valore12', 'valore13');

/*
 ---------------------------------------------------------------------------------
INSERT DI PIU' RECORD da SELECT
 --------------------------------------------------------------------------------- 
*/
INSERT INTO nome_tabella (colonna1, colonna2, colonna3)
	SELECT 
		col1,
		col2,
		col3
	FROM
		tabella1
	WHERE
		condizione1;





/*
 ---------------------------------------------------------------------------------
UPDATE SEMPLICE
 --------------------------------------------------------------------------------- 
*/		
UPDATE nome_tabella SET colonna1 = 'Acceso' 
	WHERE colonna2 = '1';



/*
 ---------------------------------------------------------------------------------
UPDATE da SELECT
 --------------------------------------------------------------------------------- 
*/	
UPDATE nome_tabella1 SET (colonna1, colonna2) =
	(
	SELECT 
		colonna_a, 
		colonna_b 
	FROM 
		nome_tabella2
	WHERE 
		nome_tabella2.id = nome_tabella1.id_tabella2
	);
/*in alternativa si può scrivere anche così*/	
UPDATE nome_tabella1 
	SET colonna1 = colonna_a,
		colonna2 = colonna_b
	FROM 
		nome_tabella2 
	WHERE 
		nome_tabella2.id = nome_tabella1.id_tabella2;
