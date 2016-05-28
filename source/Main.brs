Function Main()
    InitGATracker("UA-74239558-1", "Roku")
    initTheme()
    displayGrid()
End Function

Sub initTheme()
    app = CreateObject("roAppManager")
    app.SetTheme(CreateDefaultTheme())
End Sub
