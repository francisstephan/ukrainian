module Trans_U exposing (transl)

import Dict

latUkr = Dict.fromList [  ("a" , "а") , ("A" , "А")
                        , ("b" , "б") , ("B" , "Б")
                        , ("v" , "в") , ("V" , "В")
                        , ("h" , "г") , ("H" , "Г") 
                        , ("g" , "ґ") , ("G" , "Ґ")
                        , ("d" , "д") , ("D" , "Д")
                        , ("e" , "е") , ("E" , "Е")
                        , ("ê" , "є") , ("Ê" , "Є")
                        , ("j" , "ж") , ("J" , "Ж")
                        , ("z" , "з") , ("Z" , "З")
                        , ("y" , "и") , ("Y" , "И")
                        , ("i" , "і") , ("I" , "İ")
                        , ("ï" , "ї") , ("Ï" , "Ї")
                        , ("î" , "й") , ("Î" , "Й")
                        , ("k" , "к") , ("K" , "К")
                        , ("l" , "л") , ("L" , "Л")
                        , ("m" , "м") , ("M" , "М")
                        , ("n" , "н") , ("N" , "н")
                        , ("o" , "о") , ("O" , "О")
                        , ("p" , "п") , ("P" , "П")
                        , ("r" , "р") , ("R" , "Р")
                        , ("s" , "с") , ("S" , "С")
                        , ("t" , "т") , ("T" , "Т")
                        , ("u" , "у") , ("U" , "У")
                        , ("f" , "ф") , ("F" , "Ф")
                        , ("x" , "х") , ("X" , "Х")
                        , ("c" , "ц") , ("C" , "Ц")
                        , ("q" , "ч") , ("Q" , "Ч")
                        , ("w" , "ш") , ("W" , "Ш")
                        , ("'" , "ь")
                        , ("û" , "ю") , ("Û" , "Ю")
                        , ("â" , "я") , ("Â" , "Я")
                        , ("_" , "") -- filter _
                        ] 

latUkr_= Dict.fromList [  ("i" , "й") 
                        , ("w" , "щ") , ("W" , "Щ")
                        , ("u" , "ю") , ("U" , "Ю")
                        , ("a" , "я") , ("A" , "Я")
                        , ("'" , "Ь")
                        , ("e" , "є") , ("E" , "Є")
                        ]

subst : String -> (Dict.Dict String String) -> String
subst car dict =
  Maybe.withDefault car (Dict.get car dict)

subst_ : (String,String) -> String
subst_ dble =
  let
     (carac, sub) = dble
  in
    if sub == "_" then subst carac latUkr_ else subst carac latUkr

szip : String -> List (String,String)
szip s =
  let
    ls = s |> String.toList |> List.map String.fromChar
  in
    List.map2 Tuple.pair ls ("&" :: ls)

transl : String -> String
transl chaine =
  szip chaine
   |> List.map subst_
   |> List.foldr (++) ""
