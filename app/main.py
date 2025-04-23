from fastapi import FastAPI, UploadFile, File
from pix2tex.cli import LatexOCR
from PIL import Image
import io

app = FastAPI()
ocr = LatexOCR()

@app.post("/predict/")
async def predict_equation(file: UploadFile = File(...)):
    image = Image.open(io.BytesIO(await file.read()))
    latex = ocr(image)
    return {"latex": latex}
