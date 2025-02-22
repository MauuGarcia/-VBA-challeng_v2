Attribute VB_Name = "Module1"
Sub year_stock():

    For Each ws In Worksheets
    
        Dim WorksheetName As String
        Dim i As Long
        Dim j As Long
        Dim TCount As Long
        Dim RowA As Long
        Dim RowI As Long
        Dim PChange As Double
        Dim GIncr As Double
        Dim GDecr As Double
        Dim GV As Double
        WorksheetName = ws.Name
      
        ws.Cells(1, 9).Value = "Ticker"
        ws.Cells(1, 10).Value = "Yearly Change"
        ws.Cells(1, 11).Value = "Percent Change"
        ws.Cells(1, 12).Value = "Total Stock Volume"
        ws.Cells(1, 16).Value = "Ticker"
        ws.Cells(1, 17).Value = "Value"
        ws.Cells(2, 15).Value = "Greatest % Increase"
        ws.Cells(3, 15).Value = "Greatest % Decrease"
        ws.Cells(4, 15).Value = "Greatest Total Volume"
        
        TCount = 2
        
       
        j = 2
        
        
        RowA = ws.Cells(Rows.Count, 1).End(xlUp).Row
        
        
            
            For i = 2 To RowA
            
                
                If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
                
                
                ws.Cells(TCount, 9).Value = ws.Cells(i, 1).Value
                
                
                ws.Cells(TCount, 10).Value = ws.Cells(i, 6).Value - ws.Cells(j, 3).Value
                
                    
                    If ws.Cells(TCount, 10).Value < 0 Then
                
                    
                    ws.Cells(TCount, 10).Interior.ColorIndex = 3
                
                    Else
                
                    
                    ws.Cells(TCount, 10).Interior.ColorIndex = 4
                
                    End If
                    
                    
                    If ws.Cells(j, 3).Value <> 0 Then
                    PChange = ((ws.Cells(i, 6).Value - ws.Cells(j, 3).Value) / ws.Cells(j, 3).Value)
                    
                    
                    ws.Cells(TCount, 11).Value = Format(PChange, "Percent")
                    
                    Else
                    
                    ws.Cells(TCount, 11).Value = Format(0, "Percent")
                    
                    End If
                    
                
                ws.Cells(TCount, 12).Value = WorksheetFunction.Sum(Range(ws.Cells(j, 7), ws.Cells(i, 7)))
                
               
                TCount = TCount + 1
                
                
                j = i + 1
                
                End If
            
            Next i
            
        
        RowI = ws.Cells(Rows.Count, 9).End(xlUp).Row
      
        
      
        GV = ws.Cells(2, 12).Value
        GIncr = ws.Cells(2, 11).Value
        GDecr = ws.Cells(2, 11).Value
        
            
            For i = 2 To RowI
            
                
                If ws.Cells(i, 12).Value > GV Then
                GV = ws.Cells(i, 12).Value
                ws.Cells(4, 16).Value = ws.Cells(i, 9).Value
                
                Else
                
                GV = GV
                
                End If
                
                
                If ws.Cells(i, 11).Value > GIncr Then
                GIncr = ws.Cells(i, 11).Value
                ws.Cells(2, 16).Value = ws.Cells(i, 9).Value
                
                Else
                
                GIncr = GIncr
                
                End If
                
                
                If ws.Cells(i, 11).Value < GDecr Then
                GDecr = ws.Cells(i, 11).Value
                ws.Cells(3, 16).Value = ws.Cells(i, 9).Value
                
                Else
                
                GDecr = GDecr
                
                End If
                
           
            ws.Cells(2, 17).Value = Format(GIncr, "Percent")
            ws.Cells(3, 17).Value = Format(GDecr, "Percent")
            ws.Cells(4, 17).Value = Format(GV, "Scientific")
            
            Next i
            
        
        Worksheets(WorksheetName).Columns("A:Z").AutoFit
            
    Next ws
        
End Sub
