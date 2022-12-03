https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
--- Copyright 2021 The Australian National University, All rights reserved

module Controller where

import CodeWorld
import Model

import Data.Text (pack, unpack)

-- | Compute the new Model in response to an Event.
handleEvent :: Event -> Model -> Model
handleEvent event m@(Model ss t c) =
  case event of
    KeyPress key
      -- revert to an empty canvas
      k == "Esc" -> emptyModel

      -- write the current model to the console
      k == "D" -> trace (pack (show m)) m

      -- display the mystery image
      k == "M" -> Model mystery t c

      k == "Backspace" || k == "Delete" -> Model (tail ss) t c  -- TODO: drop the last added shape

      k == " " ->  -- TODO: finish polygon vertices

      k == "T" -> Model ss (nextTool t)  c-- TODO: switch tool

      k == "C" -> Model ss t (nextColour c) -- TODO: switch colour

      -- ignore other events
      otherwise -> m
      where
        k = unpack key

    PointerPress p -> undefined  -- TODO

    PointerRelease p -> undefined  -- TODO
    _ -> m

-- TODO
nextColour :: ColourName -> ColourName
nextColour c = case c of
    Black -> Purple
    Purple -> Blue
    Blue -> Green
    Green -> Yellow
    Yellow -> Orange
    Orange -> Red 
    Red -> Black

-- TODO
nextTool :: Tool -> Tool
nextTool tl = case tl of
    LineTool _ -> PolygonTool []
    PolygonTool _ -> RectangleTool Nothing
    RectangleTool _-> CircleTool Nothing
    CircleTool _ -> ParallelogramTool Nothing Nothing
    ParallelogramTool _ _-> SquareTool Nothing
    SquareTool _ -> LineTool Nothing
