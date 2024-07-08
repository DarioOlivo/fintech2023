import joblib
from fastapi import FastAPI
from pydantic import BaseModel,Field
#importo le librerie necessarie

#creiamo una istance
app=FastAPI()
# creo la classe QualityMModel per lo sviluppo della api basata sul modello
class QualityModel(BaseModel):
    id: int = Field(..., description="ID of the wine")
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
    #escludo top quality poichè colonna target

#importo il modello
model=joblib.load('C:\\Users\\icts22-24.323\\Desktop\\py_finale\\modello\\C__Users_icts22-24.323_Desktop_py_finale_modello')

@app.post('/modello/')
def predict_wine_quality(input_data: QualityModel):
    # Elenco delle features utilizzate dal modello
    input_features = [
        input_data.fixed_acidity,
        input_data.volatile_acidity,
        input_data.citric_acid,
        input_data.residual_sugar,
        input_data.chlorides,
        input_data.free_sulfur_dioxide,
        input_data.density,
        input_data.pH,
        input_data.sulphates,
        input_data.alcohol,
        input_data.quality
    ]

    # Attraverso il modello cerchiamo di effettuare una previsione
    # Ulteriore check per controllare che l'utente inserisca solo gli input utili al modello
    # nel caso il risulato sia uguale a 1 significa che il vino è di buona qualità, in caso sia pari a 0 significa che non è di buona qualità
    #in caso di errori ritorna una scritta error
    if len(input_features) == 11:
        prediction = model.predict([input_features])
        return {"Prediction: "
                "[0: Not the best quality wine  /1: the wine is divine, top quality!]": prediction.tolist()}
    else:
        return {"Error"}