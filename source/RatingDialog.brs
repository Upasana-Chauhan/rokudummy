Sub ShowRatingDialog()

    GATrackPageView("Rating dialog screen", "GridViewDemoNew", "Roku")

    port = CreateObject("roMessagePort")
    screen = CreateObject("roMessageDialog")
    screen.SetMessagePort(port)
    screen.SetMenuTopLeft(true)
    screen.SetTitle("Change Rating")
    screen.SetText("Some text")
    screen.AddRatingButton(1, 50, 70, "therating") ' this doesn't trigger a msg
    screen.AddButton(2, "Btn2") ' triggers a msg
    screen.AddButton(3, "Btn3") ' triggers a msg
    screen.EnableBackButton(true)
    screen.EnableOverlay(true)
    screen.Show()
   
    while true
        msg = wait(0, port)
          If type(msg) = "roMessageDialogEvent"
            if msg.isButtonPressed()
            Print msg.GetIndex()
                if msg.GetIndex() = 1
                   print type(msg); " "; msg.getIndex(); " "; msg.getData()
                end if
            else if msg.isScreenClosed()
                exit while
            end if
        end if
    end while
End Sub