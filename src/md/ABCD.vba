Sub macro()
    Set myRange = ActiveDocument.Content
    ' clear all tab stops to avoid collisions
    ActiveDocument.Paragraphs.TabStops.ClearAll
    
    ' clear numbering
    ActiveDocument.Range.Select
      Set RE = CreateObject("vbscript.regexp")
      
    RE.Pattern = "[A-Z][.]"
    
    For Each Lst In ActiveDocument.Lists
        Set Match = RE.Execute(Lst.Range.Text)
        If Match.Count Then
          Lst.ConvertNumbersToText
        End If
        Next

    ' clear first line indent
    ActiveDocument.Range.Select
    ActiveDocument.Paragraphs.FirstLineIndent = _
        CentimetersToPoints(0)
    ActiveDocument.Paragraphs.LeftIndent = _
        CentimetersToPoints(0)
    
    ' add tab stops to entire document
    ActiveDocument.Range.Select
    
    Selection.Paragraphs.TabStops.Add Position:=CentimetersToPoints(1)
    Selection.Paragraphs.TabStops.Add Position:=CentimetersToPoints(5)
    Selection.Paragraphs.TabStops.Add Position:=CentimetersToPoints(9)
    Selection.Paragraphs.TabStops.Add Position:=CentimetersToPoints(13)
    
    
    ' random algorithm that helps
    myRange.Find.Execute FindText:=vbTab, _
        ReplaceWith:="|", Replace:=wdReplaceAll
    With myRange.Find
        .MatchCase = True
        For I = 1 To 10
            .Execute FindText:="A. ", _
                ReplaceWith:="A.", Replace:=wdReplaceAll
            Next I
        .Execute FindText:="A.", _
            ReplaceWith:="|A.", Replace:=wdReplaceAll
        .Execute FindText:="A.|", _
            ReplaceWith:="A.", Replace:=wdReplaceAll
    End With
    With myRange.Find
        .MatchCase = True
        .Execute FindText:="A.", _
                ReplaceWith:="A.  ", Replace:=wdReplaceAll
    End With
    With myRange.Find
        .MatchCase = True
        For I = 1 To 10
            .Execute FindText:="B. ", _
                ReplaceWith:="B.", Replace:=wdReplaceAll
            Next I
        .Execute FindText:="B.", _
            ReplaceWith:="|B.", Replace:=wdReplaceAll
        .Execute FindText:="B.|", _
            ReplaceWith:="B.", Replace:=wdReplaceAll
    End With
    With myRange.Find
        .MatchCase = True
        .Execute FindText:="B.", _
                ReplaceWith:="B.  ", Replace:=wdReplaceAll
    End With
    With myRange.Find
        .MatchCase = True
        For I = 1 To 10
            .Execute FindText:="C. ", _
                ReplaceWith:="C.", Replace:=wdReplaceAll
            Next I
        .Execute FindText:="C.", _
            ReplaceWith:="|C.", Replace:=wdReplaceAll
        .Execute FindText:="C.|", _
            ReplaceWith:="C.", Replace:=wdReplaceAll
    End With
    With myRange.Find
        .MatchCase = True
        .Execute FindText:="C.", _
                ReplaceWith:="C.  ", Replace:=wdReplaceAll
    End With
    With myRange.Find
        .MatchCase = True
        For I = 1 To 10
            .Execute FindText:="D. ", _
                ReplaceWith:="D.", Replace:=wdReplaceAll
            Next I
        .Execute FindText:="D.", _
            ReplaceWith:="|D.", Replace:=wdReplaceAll
        .Execute FindText:="D.|", _
            ReplaceWith:="D.", Replace:=wdReplaceAll
    End With
    With myRange.Find
        .MatchCase = True
        .Execute FindText:="D.", _
                ReplaceWith:="D.  ", Replace:=wdReplaceAll
    End With
    For I = 1 To 3
        myRange.Find.Execute FindText:="||", _
            ReplaceWith:="|", Replace:=wdReplaceAll
        myRange.Find.Execute FindText:=" |", _
            ReplaceWith:="|", Replace:=wdReplaceAll
        myRange.Find.Execute FindText:="| ", _
            ReplaceWith:="|", Replace:=wdReplaceAll
        Next I
    myRange.Find.Execute FindText:="|", _
        ReplaceWith:=vbTab, Replace:=wdReplaceAll
End Sub
