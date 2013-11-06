Function PlayConnectFour(gameBoard, color)
Randomize
                Dim AcceptableMoves()
                Dim Counter
                Dim ColumnCounter
 
                Dim max,min
                Counter = -1
 
                For columns = 0 to UBound(gameBoard,1)
                                For row = 0 to uBound(gameBoard,2)
                                                If gameBoard(columns, row) <>"" Then
                                                                Counter=Counter+1
                                                End If
                                Next
                                If Counter<UBound(gameBoard,2) Then
                                                ReDim Preserve AcceptableMoves(ColumnCounter)
                                                AcceptableMoves(ColumnCounter) = columns
                                                ColumnCounter= ColumnCounter+1
                                               
                                End If
                                Counter = -1
                Next
 
                   max=uBound(AcceptableMoves)
                                min=0
                                Randomize
                                PlayConnectFour=AcceptableMoves((Int((max-min+1)*Rnd+min)))
 
 
 
End Function
 
Function CreateBlankGameBoard()
 
                Dim gameBoard
                ReDim gameBoard(6,5)
 
                CreateBlankGameBoard=gameBoard
End Function
 
Function isLegalMove(gameBoard, ColumnIndex)
If ColumnIndex >= 0 And ColumnIndex <= UBound(gameBoard)  Then
 
   For row = 0 to UBound(gameBoard,2)
                   If gameBoard(ColumnIndex, row) = ""  Then
                                   isLegalMove = True
                                   Exit Function
                   End If
               
   Next
Else
                isLegalMove = False
                'msgbox("2")
                Exit Function
End If
 
isLegalMove = False
 
End Function
 
Function FindNextPositionInColumn(gameBoard, ColumnIndex)
   For row = UBound(gameBoard,2) to 0 step -1
                   If gameBoard(ColumnIndex, row) = "" Then
                                   FindNextPositionInColumn = ColumnIndex & "," & row
                                  
                                   Exit Function
                   End If
   Next
End Function
 

Function PlayTheGame()
gameBoard = CreateBlankGameBoard()
gameCounter = 0
Do While gameCounter < (UBound(gameBoard)+1) * (UBound(gameBoard,2) +1) And EndOfGame = False
 
                gameCounter = gameCounter + 1
    gameBoardCopy = gameBoard
 
 
                Player1Column = PlayConnectFour(gameBoardcopy, "red")
                If IsLegalMove(gameBoard, Player1Column) Then
                                Player1Move = FindNextPositionInColumn(gameBoard, Player1Column)
                                'msgbox(Player1Move)
                                If Player1Move <> "Error" Then
                                                Player1Move =  Split(Player1Move, ",")
            connect_four.add Player1Move(0), Player1Move(1), "red"
                                                gameBoard(Player1Move(0), Player1Move(1))= "R"
                                                EndOfGame = isEndOfGame(gameBoard)
                                End If
                Else
                                invalid_msg("Illegal Move Attempted by Player1.  The Column Index [" & Player1Column &"] is not valid")
                                EndOfGame = True
                End If
                               
                gameCounter = gameCounter + 1
                gameBoardCopy = gameBoard
   If EndOfGame = False Then
                                Player2Column = PlayConnectFour(gameBoardCopy, "black")
                                If IsLegalMove(gameBoard, Player2Column) Then
                                                Player2Move = FindNextPositionInColumn(gameBoard, Player2Column)
                                                'msgbox(Player2Move)
                                                If Player2Move <> "Error" Then
                                                                Player2Move =  Split(Player2Move, ",")
                                                               
                                                                connect_four.add Player2Move(0), Player2Move(1), "red"
                                                                gameBoard(Player2Move(0), Player2Move(1))= "B"
                                                                EndOfGame = isEndOfGame(gameBoard)
                                                End If
                                Else
                                                invalid_msg("Illegal Move Attempted by Player2.  The Column Index [" & Player2Column &"] is not valid")
                                                EndOfGame = True
                                End If
                End If
                Loop
 End Function
 
Function isEndOfGame(gameBoard)
   isEndOfGame = False
End Function