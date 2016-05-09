Well the hint says something about operator priority or precedance.
It's as easy as that, you just have to spot where that flow is, and it turns out it's in line 17 :

if(fd=open("password",O_RDONLY,0400) < 0)

As you can see in the precedance table (http://www.difranco.net/compsci/C_Operator_Precedence_Table.htm) the relational operator < has more priority than than the assignement operator =

by that logic, we can conclude that in this line if(fd=open("password",O_RDONLY,0400) < 0), comparison will be executed first, and then fd will be assigned the value 0, which is in fact stdin

Since fd now is the stdin file descriptor, later on, the read function will actually wait for an input from the keyboard.
So all you have to do is enter 0000000000 before the program asks for the password.
When the prompt asks you for the password, you just give it 1111111111.
Tada you got your flag
