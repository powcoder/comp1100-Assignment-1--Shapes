https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
--- Copyright 2021 The Australian National University, All rights reserved

module View where

import CodeWorld
import Data.Text (pack)
import Model

-- | Render all the parts of a Model to a CodeWorld picture.
modelToPicture :: Model -> Picture
modelToPicture (Model ss t c)
  = translated 0 8 toolText
  & translated 0 7 colourText
  & colourShapesToPicture ss
  & coordinatePlane
  where
    colourText = stringToText (show c)
    toolText = stringToText (toolToLabel t)
    stringToText = lettering . pack

-- Input a tool and output the label of instructions
toolToLabel :: Tool -> String
toolToLabel a = case a of 
     LineTool _ -> "Line... click-drag-release" 
     PolygonTool[] -> "Polygon... click 3 or more times then spacebar" 
     RectangleTool _ -> "Rectangle... click-drag-release between opposite corners" 
     CircleTool _ -> "Circle... click-drag-release from opposite points on the circumfrence" 
     ParallelogramTool _ _ -> "Parallelogram... click three points, each adjacent to the next" 
     SquareTool _ -> "Square... click-drag-release between midpoints of opposite sides" 

     

-- TODO
colourShapesToPicture :: [ColourShape] -> Picture
colourShapesToPicture ls = case ls of
  [] -> blank
  x:xs -> 

-- TODO
colourShapeToPicture :: ColourShape -> Picture
colourShapeToPicture = 

-- Turn a Colour name to a specific colour in Codeworld
colourNameToColour :: ColourName -> Colour
colourNameToColour cl = case cl of
  Black -> black
  Purple -> purple
  Blue -> blue
  Green -> green
  Yellow -> yellow
  Orange -> orange
  Red -> red
  
  -- Draw Pictures based on the shape
shapeToPicture :: Shape -> Picture
shapeToPicture q = case q of
  Line m n -> polyline[m,n] 
  Polygon l -> case l of 
    l > = 3 -> solidPolygon p
    otherwise -> blank
  Rectangle(a,b)(c,d) -> translated ((a+c)/2 (b+d)/2) (solidRectangle (abs(a-c)) (abs(b-d)))
  Circle (a,b)(c,d) -> translated a b solidCircle r where r == sqrt((c-a)^2+(b-d)^2)


-- TODO
areaShapes :: [Shape] -> Tool -> Double
areaShapes = undefined
