type Var = String
type Lab = String
data Expr = EVar Var | EObj [(Lab, Var, Expr)] | ESel Expr Lab | EUpd Expr Lab Var Expr

foldExpr :: (Var -> b) -> ([(Lab, Var, b)] -> b) -> (b -> Lab -> b) -> (b -> Lab -> Var -> b -> b) -> Expr -> b
foldExpr fEvar fEObj fESel fEUpd e = case e of
    EVar v -> fEvar v
    EObj ls -> map (\l v x -> fEObj l v (rec x)) ls
    ESel x l -> fESel (rec x) l
    EUpd x1 l v x2 -> fESel (rec x1) l v (rec x2)

    where rec = fold fEvar fEObj fESel fEUpd

existeVariable :: Expr -> Var -> Bool
existeVariable e v = foldExpr (\s -> s == v) (\l s x -> (s == v) || x) (\x l -> x) (\x1 l s x2 -> x1 || (s == v) || x2) e

exprEjemplo = EUpd (EObj [("x", "v1", EVar "v1"), ("y", "v2", EVar "v2")]) "x" "v3" (EVar "v3")

