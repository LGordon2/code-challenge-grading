Function their_fib(n,username)
  Execute("their_fib = " & username &"( "& n &" )")
  
  If IsNumeric(their_fib) Then
    ' Here, it still could be an integer or a floating point number
    If CLng(their_fib) = their_fib Then
       Exit Function
    Else
       their_fib = "Error"
    End If
  End If
  their_fib = "Error"
End Function