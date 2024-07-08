import pandas as pd
import sqlite3
import requests
from io import StringIO
#qui sopra ho importato le librerie necessarie per lo sviluppo del db
#in particolare ho importato StringIo che serve creare un file da una stringa

#includo in una variabile il link al csv su github
gh = 'https://raw.githubusercontent.com/DarioOlivo/fintech2023/main/vini4.csv'
response_gh = requests.get(gh) #facciamo una request get sfrutando  la libreria requests


if response_gh.status_code == 200:
    df_vini = pd.read_csv(StringIO(response_gh.text), sep=',')#convertiamo csv in file leggibile

    #poichè ho voluto creare api che eseguono operazioni che si basano sull'id dei vini
    # aggiungo una colonna id se non esiste
    if 'id' not in df_vini.columns:
        df_vini['id'] = range(1, len(df_vini) + 1)

    # muovo l'id all'inizio de dataframe
    id_col = df_vini.pop('id')
    df_vini.insert(0, 'id', id_col)

    #la variabile db_path contiene il percorso di dove si troverà il db e anche il nome del db in questo caso "vini4"
    db_path = 'C:\\Users\\icts22-24.323\\Desktop\\py_finale\\db\\sqlite\\vini4.db'  
    #stabiliamo connessione al db
    conn = sqlite3.connect(db_path)
    df_vini.to_sql('vini', conn, index=False, if_exists='replace')  
    conn.close() #chiudiamo connessione

else:#gestisco gli errori
    print('Error !!!', response_gh.status_code)
