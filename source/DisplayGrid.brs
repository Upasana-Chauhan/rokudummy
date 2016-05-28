Function displayGrid()
    GATrackPageView("Grid screen", "Roku1", "Roku1","cat1","action1","label","1")

    port = CreateObject("roMessagePort")
    grid = CreateObject("roGridScreen")
    grid.SetMessagePort(port)
    grid.SetGridStyle("flat-movie")
    grid.setDescriptionVisible(false)
    grid.SetDisplayMode("best-fit")
    rowTitles = CreateObject("roArray", 10, true)
    for j = 0 to 10
        rowTitles.Push("[Row Title " + j.toStr() + " ] ")
    end for
    grid.SetupLists(rowTitles.Count())
    grid.SetListNames(rowTitles)
    for j = 0 to 10
    list = CreateObject("roArray", 10, true)
    for i = 0 to 10
             o = CreateObject("roAssociativeArray")
             o.ContentType = "episode"
             o.Title = "[Title" + i.toStr() + "]kdfjdslkjfdjflkdjflsdjflksdjmcxnmxnclsjdflsjdflsdjflksdjflksdjfl"
             o.ShortDescriptionLine1 = "[ShortDescriptionLine1]"+chr(10)+"hello"
             o.ShortDescriptionLine1 = "[ShortDescrnLine1]"+chr(10)+"hello"
             o.ShortDescriptionLine2 = "[ShortDescriptionLine2]"+chr(10)+"hello"
             o.Description = ""
             o.Description = "[Description] "+chr(10)+"hllooo"
             o.Rating = "NR"
             o.StarRating = "75"
             o.ReleaseDate = "[<mm/dd/yyyy]"
             o.Length = 5400
             o.Actors = []
             o.Actors.Push("[Actor1]")
             o.Actors.Push("[Actor2]")
             o.Actors.Push("[Actor3]")
             o.Director = "[Director]"
             list.Push(o)
         end for
         grid.SetContentList(j, list)
     end for
     grid.Show()
     
     while true
         msg = wait(0, port)
         if type(msg) = "roGridScreenEvent" then
             if msg.isScreenClosed() then
                 return -1
             else if msg.isListItemFocused()
                  Print "row: ";msg.GetIndex();" col: ";msg.GetData();
             
                 print "Focused msg: ";msg.GetMessage();"row: ";msg.GetIndex();
                 print " col: ";msg.GetData()
                 stringValue = "row:"+ msg.GetIndex().tostr()
                 Print stringValue
                 GATrackPageView("Grid screen", "Roku", "Roku","focused","action","label","2")
             else if msg.isListItemSelected()
                 print "Selected msg: ";msg.GetMessage();"row: ";msg.GetIndex();
                 print " col: ";msg.GetData()
                 ShowPosterScreen() 'OK button pressed
             else if msg.isButtonPressed()
                 print "button pressed: ";msg.GetIndex()
             else if msg.isremotekeypressed()
                 print "button pressed remote key: ";msg.GetIndex()
                 if msg.GetIndex() = 10 'Star button pressed
                 ShowMessageDialog("Demo title","demo text")
                 else  if msg.GetIndex() = 12 'Search button pressed
                 ShowSearchScreen()
                 endif
             endif
         endif
     end while
End Function