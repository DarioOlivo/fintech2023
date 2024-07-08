#importo le librerie necessarie 
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
import sqlite3

#creiamo una istance
app = FastAPI()

# creiamo una connessione al nostro db con i nostri dati
def get_db():
    db = sqlite3.connect('C:\\Users\\icts22-24.323\\Desktop\\py_finale\\db\\sqlite\\vini4.db')
    db.row_factory = sqlite3.Row
    return db, db.cursor()

# creo la classe WineModel per lo sviluppo delle api 
class WineModel(BaseModel):
    id: int = Field(..., description="ID of the wine")#impongo vincoli
    fixed_acidity: float
    volatile_acidity: float
    citric_acid: float
    residual_sugar: float
    chlorides: float
    free_sulfur_dioxide: float
    density: float
    pH: float
    sulphates: float
    alcohol: float
    quality: int
    type: int
    top_quality:int

# CRUD operazioni

#creazione della POST, possiamo aggiungere record compilando i campi nel body della nostra chiamata
@app.post("/wines/", response_model=WineModel)
def create_wine(wine: WineModel):
    db, cursor = get_db()
    try:
        query = '''
            INSERT INTO vini (
                id, fixed_acidity, volatile_acidity, citric_acid, residual_sugar,
                chlorides, free_sulfur_dioxide, density,
                pH, sulphates, alcohol, quality, type, top_quality
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        '''
        cursor.execute(query, (
            wine.id, wine.fixed_acidity, wine.volatile_acidity, wine.citric_acid,
            wine.residual_sugar, wine.chlorides, wine.free_sulfur_dioxide,
            wine.density, wine.pH,
            wine.sulphates, wine.alcohol, wine.quality, wine.type, wine.top_quality
        ))
        db.commit()
        return wine
    finally:#chiusura connessione
        db.close()

#creiamo una get che ti passa il record inserendo l'id del vino
@app.get("/wines/{wine_id}", response_model=WineModel)
def read_wine(wine_id: int):
    db, cursor = get_db()
    try:
        query = 'SELECT * FROM vini WHERE id = ?'
        cursor.execute(query, (wine_id,))
        wine = cursor.fetchone()
        if wine:
           
            wine_dict = dict(wine)
            return wine_dict
        raise HTTPException(status_code=404, detail="Wine not found")#se il vino non viene trovato riporta errore 404
    finally:
        db.close()

#creo update che funziona attraverso l'id.
#le modifiche vengono inseriet all'interno del body, poi viene eseguita la put
@app.put("/wines/{wine_id}", response_model=WineModel)
def update_wine(wine_id: int, wine: WineModel):
    db, cursor = get_db()
    try:
        query = '''
            UPDATE vini SET
            fixed_acidity=?, volatile_acidity=?, citric_acid=?, residual_sugar=?,
            chlorides=?, free_sulfur_dioxide=?,  density=?,
            pH=?, sulphates=?, alcohol=?, quality=?, type=?, top_quality=?
            WHERE id=?
        '''
        cursor.execute(query, (
            wine.fixed_acidity, wine.volatile_acidity, wine.citric_acid,
            wine.residual_sugar, wine.chlorides, wine.free_sulfur_dioxide,
         wine.density, wine.pH,
            wine.sulphates, wine.alcohol, wine.quality, wine.type, wine_id, wine.top_quality
        ))
        db.commit()
        return wine
    finally:
        db.close()

#creazione della delete.Inseriamo l'id del record che vogliamo eliminare
@app.delete("/wines/{wine_id}", response_model=dict)
def delete_wine(wine_id: int):
    db, cursor = get_db()
    try:
        query = 'DELETE FROM vini WHERE id = ?'
        cursor.execute(query, (wine_id,))
        db.commit()
        return {"status": "Wine deleted"}#se la chiamata va a buon fine ritorna "wine eliminated"
    finally:
        db.close()