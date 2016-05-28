Sub ShowSearchScreen()
   ' GATrackPageView("Show search screen", "GridViewDemoNew", "Roku")

    displayHistory = true
    history = CreateObject("roArray", 1, true)
    'prepopulate the search history with sample results
    history.Push("seinfeld")
    history.Push("fraiser")
    history.Push("cheers")
    port = CreateObject("roMessagePort")
    screen = CreateObject("roSearchScreen")
    'commenting out SetBreadcrumbText() hides breadcrumb on screen
    screen.SetBreadcrumbText("", "search")
    screen.SetMessagePort(port)
    if displayHistory
        screen.SetSearchTermHeaderText("Recent Searches:")
        screen.SetSearchButtonText("search")
        screen.SetClearButtonText("clear history")
        screen.SetClearButtonEnabled(true) 'defaults to true
        screen.SetSearchTerms(history)
    else
        screen.SetSearchTermHeaderText("Suggestions:")
        screen.SetSearchButtonText("search")
        screen.SetClearButtonEnabled(false)
    endif
    screen.Show()
    print "Waiting for a message from the screen..."
    ' search screen main event loop
    done = false
    while done = false
        msg = wait(0, screen.GetMessagePort())
        if type(msg) = "roSearchScreenEvent"
            if msg.isScreenClosed()
                print "screen closed"
                done = true
            else if msg.isCleared()
                print "search terms cleared"
                history.Clear()
            else if msg.isPartialResult()
                print "partial search: "; msg.GetMessage()
                if displayHistory
                Print "display hisotry1"
                    screen.SetSearchTerms(GenerateSearchSuggestions(msg.GetMessage()).pop())
                  ' displayGrid()
               '   showImageCanvas()
               
              
                endif
            else if msg.isFullResult()
                print "full search: "; msg.GetMessage()
                history.Push(msg.GetMessage())
                if displayHistory
                   Print "display hisotry2"
                   screen.AddSearchTerm(GenerateSearchSuggestions(msg.GetMessage()))
                end if
                'uncomment to exit the screen after a full search result:
                'done = true
            else
                print "Unknown event: "; msg.GetType(); " msg: "; msg.GetMessage()
            endif
        endif
    endwhile
    print "Exiting..."
End Sub 

Function GenerateSearchSuggestions(partSearchText As String) As Object
    suggestions = CreateObject("roArray", 1, true)
    length = len(partSearchText)
    if length > 6
        suggestions.Push("ghost in the shell")
        suggestions.Push("parasite dolls")
        suggestions.Push("final fantasy")
        suggestions.Push("ninja scroll")
        suggestions.Push("space ghost")
        suggestions.Push("hellboy")
    else if length > 5
        suggestions.Push("parasite dolls")
        suggestions.Push("final fantasy")
        suggestions.Push("ninja scroll")
        suggestions.Push("space ghost")
        suggestions.Push("hellboy")
    else if length > 4
        suggestions.Push("final fantasy")
        suggestions.Push("ninja scroll")
        suggestions.Push("space ghost")
        suggestions.Push("hellboy")
    else if length > 3
        suggestions.Push("ninja scroll")
        suggestions.Push("space ghost")
        suggestions.Push("hellboy")
    else if length > 2
        suggestions.Push("space ghost")
        suggestions.Push("hellboy")
    else if length > 1
        suggestions.Push("hellboy")
    else if length > 0
      '  suggestions.Push("transformers")
       
             o = CreateObject("roAssociativeArray")
             o.ContentType = "episode"
             o.Title = "[Title"
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
            suggestions.Push(o)
    endif
    
    return suggestions
End Function

Sub showImageCanvas() 
    canvasItems = [
        { 
            url:"http://192.168.1.23/boardwalk.jpg"
            TargetRect:{x:100,y:100,w:400,h:300}
        },
        {   
            url:"http://192.168.1.23/walking.jpg"
            TargetRect:{x:500,y:400,w:400,h:300}
        },
        { 
            Text:"Hello ImageCanvas"
            TextAttrs:{Color:"#FFCCCCCC", Font:"Medium",
            HAlign:"HCenter", VAlign:"VCenter",
            Direction:"LeftToRight"}
            TargetRect:{x:390,y:357,w:500,h:60}
        }
    ] 
 
   canvas = CreateObject("roImageCanvas")
   port = CreateObject("roMessagePort")
   canvas.SetMessagePort(port)
   'Set opaque background
   canvas.SetLayer(0, {Color:"#FF000000", CompositionMode:"Source"}) 
   canvas.SetRequireAllImagesToDraw(true)
   canvas.SetLayer(1, canvasItems)
   canvas.Show() 
   while(true)
       msg = wait(0,port) 
       if type(msg) = "roImageCanvasEvent" then
           if (msg.isRemoteKeyPressed()) then
               i = msg.GetIndex()
               print "Key Pressed - " ; msg.GetIndex()
               if (i = 2) then
                   ' Up - Close the screen.
                   canvas.close()
               end if
           else if (msg.isScreenClosed()) then
               print "Closed"
               return
           end if
       end if
   end while
End Sub
