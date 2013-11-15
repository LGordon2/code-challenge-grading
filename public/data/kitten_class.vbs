class Kitten

Public x_location
Public y_location
Private goal
Private location_history
Private mazeArray

Private Sub Class_Initialize   ' Setup Initialize event.
      x_location= 9
y_location= 9
goal="3,4"
mazeArray = Array("ES","WS","","ES","EW","EW","EW","EW","EW","WS","NS","NS","","NE","EW","EW","EW","EW","W","NS","NS","NS","","ES","EW","EW","EW","EWS","EW","NWS","NS","NE","
X","NS","","","","NS","","NS","NS","S","S","NS","ES","EW","WS","NS","","NS","NS","NS","NES","NWS","NS","S","NS","NS","ES","NW","NS","NS","NS","NS","NS","NS","NS","NS","NS","S","NS","NS","NS","NS","NS","NS","N","NS","NS","NS","NS","NE","NW","NS","NS","NE","EW","NW","NS","NS","NE","EW","EW","NW","NE","EW","EW","EW","NEW","NW")
End Sub

Private Function add_to_location_history()
location_history = location_history & ";" & x_location & "," & y_location
End Function
Public Function get_directions(index)
get_directions = mazeArray(index)
End Function

Public Function Where()
Where = x_location & "," & y_location
End Function

Public Function Move(direction)
Select Case lcase(direction)
Case "north"
If inStr(Look(), "N") Then
add_to_location_history()
moveKitten("north")
y_location = y_location -1

End If
Case "south"
If inStr(Look(), "S") Then
add_to_location_history()
moveKitten("south")
y_location = y_location +1
End If
Case "east"
If inStr(Look(), "E") Then
add_to_location_history()
moveKitten("east")
x_location = x_location +1
End If
Case "west"
If inStr(Look(), "W") Then
add_to_location_history()
moveKitten("west")
x_location = x_location -1
End If
End Select

End Function

Public Function Look()
Look = MazeArray(x_location + (y_location * 10))
End Function

Public Function Remember()
Remember = location_history
End Function

Public Function Smell()
Smell = goal
End Function

End Class
