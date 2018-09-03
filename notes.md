1. given two numbers, do one thing or the other one time. time complexity O(1); same for space
2. iterating over the array, so in the worst case, time complexity depends on the number of elements in the array, n. time complexity is 'linear', aka O(n).
3. Iterating through an array, will divide by 2, n/2 but n dominates so it's just O (n)
4. Best case: constant. If the element we're looking for is the first one in the array, it'll meet the break condition and exit immediately.
Worst case: linear. The loop will iterate through every element in the array if the element we're looking for is the last one or not present in the array at all.
5. have to do two iteractions with all the .each, but that's 2n, which reduces to O(n)
6. best case is 1, worst case is n
7.