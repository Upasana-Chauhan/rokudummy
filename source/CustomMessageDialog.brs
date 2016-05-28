Sub ShowMessageDialog( title="", text="" )
print "message shown"
    GATrackPageView("Dialog screen simple", "GridViewDemoNew", "Roku")

    port = CreateObject( "roMessagePort" )
    dialog = CreateObject( "roMessageDialog" )
    dialog.SetMessagePort( port )
    dialog.SetTitle( title )
    dialog.SetText( text )
    dialog.AddButton( 1, "List Dialog" )
    dialog.Show()
    dialog.EnableBackButton(true)
    dialog.EnableOverlay(true)
    
    While True
        dlgMsg = wait(0, dialog.GetMessagePort())
        If type(dlgMsg) = "roMessageDialogEvent"
            if dlgMsg.isButtonPressed()
            Print dlgMsg.GetIndex()
                if dlgMsg.GetIndex() = 1
                ShowListDialog()
                exit while
                end if
            else if dlgMsg.isScreenClosed()
                dialog.Close()
                exit while
            end if
        end if
    end while 
End Sub
