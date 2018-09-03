# bigO

BIG O
take aways:

BigO is a representation of the worst case scenario...

-O(1)
basically if you just see functions on the variable in which n is acting as a math vriable, then time-complexity is usually just 1.

-O(n)
here you have one iteration or process that you have to do ’n times’, aka more times if n is bigger

*Note*
drop constants by input domination… 1million + 1 => 1 doesn’t really matter.
the sum of numbers from 1 to n is ALWAYS, n * (n+1)/2
big O is always worst case


-O log(n)
-typically if every iteration you are cutting your input size (in half, in quarters, etc…) then it’s going to be logarithmic
-typically you drop the base in big O analysis, because it’s sorta like a constant

-Recursive functions:
Every time you call the function it allocates memory for that function, and with a recursive function that space is dependent on n, so O(n) space complexity