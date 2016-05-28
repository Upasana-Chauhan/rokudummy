Sub ShowListDialog()
   GATrackPageView("Dialog list simple", "GridViewDemoNew", "Roku")

   port = CreateObject("roMessagePort") 
   rowTitles = ["Rating Dialog", "Exit", "Row 3", "Row 4", "Row 5", "Row 6", "Row 7"] 
   dialog = createMessageDialog(port, "title",rowTitles) 
   dialog.Show()
  
   while true 
      msg = wait(0, port) 
      print type(msg) 
      print "isButtonPressed: ";msg.isButtonPressed() 
      print "isRemoteKeyPressed: ";msg.isRemoteKeyPressed() 
      print "isScreenClosed: ";msg.isScreenClosed() 
      print "isListItemFocused: ";msg.isListItemFocused() 
      print "isListItemSelected: ";msg.isListItemSelected() 
      print "GetType: ";msg.GetType() 
      print "GetMessage: ";msg.GetMessage() 
      print "GetIndex: ";msg.GetIndex() 
      print "GetData: ";msg.GetData() 
      if type(msg) = "roMessageDialogEvent" then 
          if msg.isButtonPressed() and msg.GetIndex() = 1 then 
            print "canceled" 
            dialog.Close() 
            Exit while
          else if msg.isButtonPressed() and msg.GetIndex() = 0 then 
            Print "showratingdialog"
            ShowRatingDialog()
            Exit while
          else if msg.isScreenClosed()
            Print "close"
            exit while
          endif 
     endif 
   end while 
End Sub

Function createMessageDialog(port As Object, title As String, buttons As Object) As Object
    dialog = CreateObject("roMessageDialog")
    if not(type(port) = "roMessagePort") then
        port = CreateObject("roMessagePort")
    endif
    dialog.SetMessagePort(port)
    dialog.SetTitle(title)
    dialog.EnableBackButton(true)
    dialog.EnableOverlay(true)
   ' if len(message) > 0 then dialog.SetText(message)
   ' dialog.EnableOverlay(enableOverlay)
   ' dialog.SetMenuTopLeft(enableTopLeft)
   ' if enableBusyAnimation then dialog.ShowBusyAnimation()
    Print buttons.Count()
    for i = 0 to buttons.Count() - 1
        dialog.AddButton(i, buttons[i])
    end for
    return dialog
End Function
