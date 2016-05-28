Function ShowPosterScreen()
    GATrackPageView("Grid screen", "GridViewDemo1", "Roku","","","","")
     port = CreateObject("roMessagePort")
     poster = CreateObject("roPosterScreen")
     poster.SetBreadcrumbText("[location1]", "[location2]")
     poster.SetMessagePort(port)
     list = CreateObject("roArray", 10, true)
     For i = 0 To 10
         o = CreateObject("roAssociativeArray")
         o.ContentType = "episode"
         o.Title = "[Title]"
         o.ShortDescriptionLine1 = "[ShortDescriptionLine1]"
         o.ShortDescriptionLine2 = "[ShortDescriptionLine2]"
         o.Description = ""
         o.Description = "[Description] "
         o.Rating = "NR"
         o.StarRating = "75"
         o.ReleaseDate = "[<mm/dd/yyyy]"
         o.Length = 5400
         o.Categories = []
         o.Categories.Push("[Category1]")
         o.Categories.Push("[Category2]")
         o.Categories.Push("[Category3]")
         o.Actors = []
         o.Actors.Push("[Actor1]")
         o.Actors.Push("[Actor2]")
         o.Actors.Push("[Actor3]")
         o.Director = "[Director]"
         list.Push(o)
     End For
     poster.SetContentList(list)
     poster.Show() 
 
     While True
         msg = wait(0, port)
         If msg.isScreenClosed() Then
             return -1
         Else If msg.isListItemSelected()
             print "msg: ";msg.GetMessage();"idx: ";msg.GetIndex()
             ShowDetailedView()
         End If
     End While
 End Function