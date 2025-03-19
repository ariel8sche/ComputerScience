data Form = Prop String | And Form Form | Or Form Form | Neg Form deriving Show

foldForm :: (String -> t) -> (t -> t -> t) -> (t -> t -> t) -> (t -> t) -> Form -> t
foldForm fProp fAnd fOr fNeg form = case form of
    Prop s -> fProp s
    And f1 f2 -> fAnd (rec f1) (rec f2)
    Or f1 f2 -> fOr (rec f1) (rec f2)
    Neg f -> fNeg (rec f)

    where rec = foldForm fProp fAnd fOr fNeg

ejemplo1 = Prop "p"
ejemplo2 = And (Prop "p") (Prop "q")
ejemplo3 = Or (Prop "p") (Prop "q")
ejemplo4 = Or (And (Prop "p") (Prop "q")) (Prop "q")
ejemplo5 = Or (And (Prop "p") (Prop "q")) (Neg (And (Prop "q") (Prop "p")))
ejemplo6 = Or (And (Neg (Prop "p")) (Prop "q")) (Prop "q")

fmn :: Form -> Bool -> Form
fmn = foldForm (\s b -> if b then Prop s else Neg (Prop s)) (\f1 f2 b -> if b then And (f1 b) (f2 b) else Or (f1 False) (f2 False)) (\f1 f2 b -> if b then Or (f1 b) (f2 b) else And (f1 False) (f2 False)) (\f b-> if b then (f False) else (f True))

