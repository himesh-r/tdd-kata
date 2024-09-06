# tdd-kata

Requirements:
Implement a simple string calculator function which takes string of comma separated numbers as input

=> add("2,3")

Expected output - 5

add() method can accept any amount of non-negative numbers

Allow add method to handle "\n" as a delimiter along with of ",". e.g. add("2\n3,4") should return 9

Besides above, user can add a custom delimiter by prefixing delimiter in input as "//<custom-delimiter>\n" e.g. add("//;\n3;5") should return 8

Passing negative numbers should raise an exception
