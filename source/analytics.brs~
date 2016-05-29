Function InitGATracker(AccountID As String, HostName As String) As Object
    resinfo = CreateObject("roDeviceInfo")
    m.GATracker = CreateObject("roAssociativeArray")
    m.GATracker.Account     = AccountID 'The Google Account ID(s) (utmac)
    m.GATracker.Version     = "1" 'The version of ga.js (utmwv)
    If Len(HostName) > 0 Then
        m.GATracker.HostName = HostName 'Domain (utmhn)
    Else
        m.GATracker.HostName = "Roku" 'Domain (utmhn)
    End If
    m.GATracker.Language    = "en-us" 'Language of browser (utmul)
    m.GATracker.Resolution  = resinfo.GetDisplayMode() + " " + resinfo.GetDisplayType() 'Resolution and TV type (utmsr)
    m.GATracker.ColorDepth  = "24-bit" 'Color depth of display (utmsc)
    m.GATracker.Debug       = true 'Set debug printing to false
    m.GATracker.Pretend     = False 'Set pretend mode to false
End Function

Function GATrackPageView(PageTitle As String, PageURL As String, UserVal As String, ECategory As String, EAction As String, ELabel As String, EValue As String) As Object
Print "GATrackPageView enter"
    GATrackEvent(PageTitle, PageURL, UserVal, ECategory, EAction, ELabel, EValue)
    Print "GATrackPageView outside"
    
End Function

Function GATrackEvent(PageTitle As String, PageURL As String, UserVal As String, ECategory As String, EAction As String, ELabel As String, EValue As String)
    If Len(m.GATracker.Account) = 0 Then
        If m.GATracker.Debug Then Print "GA Tracker Error: No GA account id specified"
        Return 0
    End IF
    If Len(ECategory) > 0 And Len(EAction) > 0 Then
        is_event = True
    Else
        is_event = False
    End If
    PA = Len(PageTitle): PB = Len(PageURL)
    If PA = 0 And PB > 0 Then PageTitle = PageURL
    If PB = 0 And PA > 0 Then PageURL = PageTitle
    If PA = 0 And PB = 0 Then
        PageTitle = "Roku": PageURL = "Roku"
    End If
    If Len(UserVal) = 0 Then UserVal = "Roku"

    timestamp = CreateObject("roDateTime")
    xfer = CreateObject("roURLTransfer")

    var_utmn    = GARandNumber(1000000000,9999999999).ToStr()   'Random Request Number
    var_cookie  = GARandNumber(1000000000,9999999999).ToStr()   'Random Cookie Number
    var_random  = GARandNumber(1000000000,2147483647).ToStr()   'Random Number Under 2147483647
    var_today   = timestamp.asSeconds().ToStr()                 'Unix Timestamp For Current Date

    urchin_url = "http://www.google-analytics.com/__utm.gif?utmwv=1&utmn=" + var_utmn
    urchin_url = urchin_url + "&utmsr=" + xfer.Escape(m.GATracker.Resolution)
    urchin_url = urchin_url + "&utmsc=24-bit&utmul=" + xfer.Escape(m.GATracker.Language)
    urchin_url = urchin_url + "&utmje=0&utmfl=-&utmdt=" + xfer.Escape(PageTitle)
    urchin_url = urchin_url + "&utmhn=" + xfer.Escape(m.GATracker.HostName)
    urchin_url = urchin_url + "&utmr=-&utmp=" + xfer.Escape(PageURL)
    urchin_url = urchin_url + "&utmac=" + m.GATracker.Account
    urchin_url = urchin_url + "&utmcc=__utma%3D" + var_cookie
    urchin_url = urchin_url + "." + var_random + "." + var_today + "." + var_today + "." + var_today
    urchin_url = urchin_url + ".2%3B%2B__utmb%3D" + var_cookie
    urchin_url = urchin_url + "%3B%2B__utmc%3D" + var_cookie
    urchin_url = urchin_url + "%3B%2B__utmz%3D" + var_cookie
    urchin_url = urchin_url + "." + var_today
    urchin_url = urchin_url + ".2.2.utmccn%3D(direct)%7Cutmcsr%3D(direct)%7Cutmcmd%3D(none)%3B%2B__utmv%3D" + var_cookie
    urchin_url = urchin_url + "." + xfer.Escape(UserVal) + "%3B"
    Print EValue+"end"
    If is_event Then
        urchin_url = urchin_url + "&utme=5(" + xfer.Escape(ECategory) + "*" + xfer.Escape(EAction)
        If Len(ELabel) > 0 Then urchin_url = urchin_url + "*" + xfer.Escape(ELabel)
        If Len(EValue) > 0 Then  urchin_url = urchin_url + ")(" + xfer.Escape(EValue)
        urchin_url = urchin_url + ")&utmt=event"
    End If

    If m.GATracker.Pretend Then
        response = "In pretend mode"
    Else
        xfer.SetURL(urchin_url)
        response = xfer.GetToString()
    End If
    If m.GATracker.Debug Then
        If is_event Then
            Print "GA Tracker: Sent an event with response: " + response
        Else
            Print "GA Tracker: Sent a page view with response: " + response
        End If
        Print "GA Tracker: URL - " + urchin_url
    End If
End Function

Function GARandNumber(num_min As Integer, num_max As Integer) As Integer
    Return (RND(0) * (num_max - num_min)) + num_min
End Function
