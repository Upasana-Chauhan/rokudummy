Function CreateDefaultTheme() as Object
    theme = CreateObject("roAssociativeArray")

  '  theme.ThemeType = "generic-dark"

    ' All these are greyscales
    theme.GridScreenBackgroundColor = "#363636"
    theme.GridScreenMessageColor    = "#808080"
    theme.GridScreenRetrievingColor = "#CCCCCC"
    theme.GridScreenListNameColor   = "#FFFFFF"

    ' Color values work here
    theme.GridScreenDescriptionTitleColor    = "#001090"
    theme.GridScreenDescriptionDateColor     = "#FF005B"
    theme.GridScreenDescriptionRuntimeColor  = "#5B005B"
    theme.GridScreenDescriptionSynopsisColor = "#606000"
    
    'used in the Grid Screen
    theme.CounterTextLeft           = "#FF0000"
    theme.CounterSeparator          = "#00FF00"
    theme.CounterTextRight          = "#0000FF"
    
    theme.GridScreenLogoHD          = "pkg:/images/Logo_Overhang_Roku_SDK_HD.png"

    theme.GridScreenLogoOffsetHD_X  = "400"
    theme.GridScreenLogoOffsetHD_Y  = "0"
    theme.GridScreenOverhangHeightHD = "99"

    theme.GridScreenLogoSD          = "pkg:/images/Logo_Overhang_Roku_SDK_SD43.png"
    theme.GridScreenOverhangHeightSD = "66"
    theme.GridScreenLogoOffsetSD_X  = "0"
    theme.GridScreenLogoOffsetSD_Y  = "0"
    
    ' to use your own focus ring artwork 
    'theme.GridScreenFocusBorderSD        = "pkg:/images/GridCenter_Border_Movies_SD43.png"
    'theme.GridScreenBorderOffsetSD  = "(-26,-25)"
    'theme.GridScreenFocusBorderHD        = "pkg:/images/GridCenter_Border_Movies_HD.png"
    'theme.GridScreenBorderOffsetHD  = "(-28,-20)"
    
    ' to use your own description background artwork
    'theme.GridScreenDescriptionImageSD  = "pkg:/images/Grid_Description_Background_SD43.png"
    'theme.GridScreenDescriptionOffsetSD = "(125,170)"
    'theme.GridScreenDescriptionImageHD  = "pkg:/images/Grid_Description_Background_HD.png"
    'theme.GridScreenDescriptionOffsetHD = "(190,255)"
    

    return theme
End Function
