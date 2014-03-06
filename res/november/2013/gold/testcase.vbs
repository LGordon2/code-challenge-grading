Function RandomPlayer(gameBoard, color)

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
                                RandomPlayer=AcceptableMoves((Int((max-min+1)*Rnd+min)))
 
 
 
End Function
 
Function CreateBlankGameBoard()
 
                Dim gameBoard
                ReDim gameBoard(7,5)
 
                CreateBlankGameBoard=gameBoard
End Function
 
 
Function PlayConnectFour(gameBoardString, playerName, color)
	
	gameBoardJaggedArray = Split(gameBoardString, ";")
	gameBoard = CreateBlankGameBoard()

	For k = 0 to uBound(gameBoardJaggedArray)
		gameBoardJaggedArray(k) = Split(gameBoardJaggedArray(k), ",")
	Next


	For i = 0 to uBound(gameBoard)
		
		For j = 0 to uBound(gameBoard,2)
			gameBoard(i,j) = gameBoardJaggedArray(j)(i)
		Next
	Next
	
	Execute("columnMove = " & playerName &"( gameBoard, """& color & """)")
	
	
	PlayConnectFour = ColumnMove

End Function
