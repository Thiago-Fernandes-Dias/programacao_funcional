module Ex8 (imc, Altura, Peso, Nome, IMC (..), IMCParams (..)) where

type Nome = String

type Peso = Double

type Altura = Double

data IMCParams = IMCParams
  { peso :: Maybe Double,
    altura :: Maybe Double,
    nome :: Maybe String
  }

data IMC = IMC (Maybe String) Double

objToData :: (Maybe Nome, Maybe Peso, Maybe Altura) -> IMCParams
objToData (mn, mp, ma) = IMCParams mp ma mn

imc :: [(Maybe Nome, Maybe Peso, Maybe Altura)] -> [Maybe IMC]
imc = map (calcImc . objToData)

calcImc :: IMCParams -> Maybe IMC
calcImc params = do
  a <- altura params
  p <- peso params
  return $ IMC (nome params) (p / a ^ 2)