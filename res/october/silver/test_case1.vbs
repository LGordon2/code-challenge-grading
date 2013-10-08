document.write("****Test Case 1****<BR>")
Dim testCase1
Dim expectedGCD_testCase1
Dim actualGCD_testCase1

expectedGCD_testCase1 = 65535
actualGCD_testCase1 = SilverChallenge(Array(65535, 4294967295))
document.write("Expected GCD: "& expectedGCD_testCase1 &"<BR>")
document.write("Actual GCD:"&actualGCD_testCase1&"<BR>")

If actualGCD_testCase1 = expectedGCD_testCase1 Then
	document.write("<font color=""green"">PASS</font><BR>")
Else
	document.write("<font color=""red"">FAIL</font><BR>")
End If
document.write("*****************")