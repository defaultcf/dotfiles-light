import XMonad
import XMonad.Config.Xfce

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops -- ewmh

import XMonad.Layout
import XMonad.Layout.Gaps
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns

import XMonad.Util.EZConfig


main = xmonad $ ewmh xfceConfig
     { terminal = "xfce4-terminal"
     , modMask  = mod4Mask
     , layoutHook = avoidStruts $ myLayout
     }

     `additionalKeysP`
     [
       ("M-<Return>", spawn "rofi -show run")
     ]


myLayout = tiled ||| mtiled ||| full ||| threecol ||| grid
  where
    nmaster  = 1
    delta    = 2/100
    ratio    = 5/8
    rt       = spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True
                 $ ResizableTall nmaster delta ratio []
    tiled    = smartBorders rt
    mtiled   = smartBorders $ Mirror rt
    full     = noBorders Full
    threecol = ThreeColMid 1 (3/100) (1/2)
    grid     = GridRatio (3/3)
