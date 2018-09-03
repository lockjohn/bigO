
# arrays

1. given two numbers, do one thing or the other one time. time complexity O(1); same for space
2. iterating over the array, so in the worst case, time complexity depends on the number of elements in the array, n. time complexity is 'linear', aka O(n).
3. Iterating through an array, will divide by 2, n/2 but n dominates so it's just O (n)
4. Best case: constant. If the element we're looking for is the first one in the array, it'll meet the break condition and exit immediately.
Worst case: linear. The loop will iterate through every element in the array if the element we're looking for is the last one or not present in the array at all.
5. have to do two iteractions with all the .each, but that's 2n, which reduces to O(n)
6. best case is 1, worst case is n
7. worst case n squared, each loop calls a function which is O(n); best case: linear
8. worst case: n(n + 1))/2. Therefore, if you remove all of the constant factors, it would still be (n)^2.

#iterations
1. double for loops - worst case O(n^2) (technicall n * m)
2. reverse iteration still dependent on n so n-squared
3. "The fastest-growing term on the righthand side is 2nm. Since n > m, this term grows faster than m2. Hence, iterative_3 runs in O(nm) time." -follow up this explanation
4. O(n) time complexity, same for space: Remember that with a recursive function, the procedure for figuring out the time complexity is:

Evaluate the time complexity of one pass through the function, ignoring the recursive calls.
Evaluate how many recursive calls are made, and what the individual time complexities of those calls are.
If the time complexity of one pass is constant, then it's enough to find the number of recursive calls that are made. All the time complexities of these calls will be constant.
Remember that if one pass through the function is not constant, then the input that you give to the recursive call may change its time complexity (e.g., if a function takes in an array and you pass only part of that array to a recursive call, then your time complexity will depend on how large that part of the array is)
Add together all the recursive calls with their respective time complexities. NB: in the case where one pass is constant, the number of calls is equal to the total time complexity (why?).
With that in mind, recall the function that we're asked to find the time complexity of:

def rec_mystery(n)
  return n if n < 5

  rec_mystery(n - 5)
end
One pass through this function is clearly a constant time operation. Yay! That means we simply need to find the number of recursive calls that we're making. The diagram below represents those calls. For the sake of simplicity, we'll assume that n mod 5 = 2 and thus eventually reaches 2, but this assumption doesn't change our underlying analysis.

n → n - 5 → n - 10 → ... → 2

How many calls have we made? Let's work backward. We start at 0, and add 5 until we reach n. The number of 5's in our sum is equal to the number of recursive calls being made.

2 + 5 + 5 + 5 + ... + 5 = n

=> 2 + 5 x (number of calls) = n

=> number of calls = (n - 2)/5

The number of calls is (n - 2)/5, and thus rec_mystery runs in O(n) time.

5. O log(n)
6. 2 to the n time complexity - branching tree: Level k from the top does 2^k calls
7. rec_mystery_3
This function looks harder than our previous two, but it's actually easier to decipher than it looks. Recall the code:

void rec_mystery_3(int n, int m, int o)
{
  if (n <= 0)
  {
    printf("%d, %d\n", m, o);
  }
  else
  {
    rec_mystery_3(n-1, m+1, o);
    rec_mystery_3(n-1, m, o+1);
  }
}
NB: interviewers will sometimes have you to read or parse code in a language that's unfamiliar to you, which i why we've included a couple such examples in this assignment!

This function takes in three inputs instead of one: n, m, and o. Don't let that deter you! Let's approach it just as we did the previous two problems. One pass through this function runs in constant time -- we do a check to see how large n is, and then we add or subtract from our inputs (n - 1, m + 1, etc.) before making our two recursive calls (which we ignore, for now).

So, that leaves us to figure out how many recursive calls are being made. Let's draw a tree:



As we can see, this looks a lot like our call tree for the Fibonacci numbers -- there are just more variables there. Level k from the top does 2k calls, which was exactly the case with #fibonacci as well.

One other key observation, however, is that this call tree will terminate when n = 0. That's important -- it means that not just each level, but the total number of levels, is determined only by n. This tree will terminate at level n, when the input in n's place is equal to 0. Hence, as with fibonacci, we get:

number of calls = 1 + 2 + 4 + ... + 2n - 1 + 2n

=> number of calls = 2n + 1 - 1

So, rec_mystery_3 runs in O(2n) time.

grab_bag
Now this is where our recursion gets a little crazy. Recall our grab_bag code:

class Array
  def grab_bag
    return [[]] if empty?
    bag = take(count - 1).grab_bag
    bag.concat(bag.map { |handful| handful + [last] })
  end
end
This example is a great place to use bounding. To do so, it's helpful to first know what this code does. In words, this function creates all possible "grab bags" of the first n - 1 elements in our array (that's what the take(count - 1).grab_bag does). Then, it takes that big set of grab bags and adds a bunch more grab bags: it takes each grab bag and adds the array's last element onto it. The grab bags containing the last element get combined with the grab bags that don't contain the last element, and the whole set of those grab bags gets returned.

The key here is that this function differentiates between whether an element (namely, last) is in or out. That's exactly how a subset is formed. For each element el in the original array, we decide whether to include or not include el. In other words, this function is returning the set of all subsets of elements in the array.

This way of defining subsets (in and out elements) also gives us a clue as to what the lower bound on our time complexity must be. There are 2n subsets of an array of size n, since we have exactly 2 choices for each of the n elements: in or out. Hence, we're producing an array (the set of subsets) that is exponentially large in comparison to the input, so our time complexity will be at least O(2n).

To show that the time complexity is exactly O(2n), we will use a technique called mathematical induction. This is a somewhat advanced topic that you're not expected to know coming into the course, but the basic idea of induction is as follows:

Prove that the base cases run in the expected time complexity (exponential with respect to their small input sizes).
Assume that grab_bag runs in O(2n - 1) for an array of size n - 1. Use this assumption to prove that this function runs in 2n time on an array of size n.
We won't go into detail about why mathematical induction is a valid proof technique, but the idea is that we're creating a logical chain, starting at the base case, and proving the time complexity for each link in that chain. More details can be found on Wikipedia.

In Step 1, we simply observe that for the base case, an array of size 0, grab_bag simply does one comparison and returns.

Now, for Step 2, we will assume that grab_bag runs in 2n - 1 time for an array of size n - 1. That means that the line bag = take(count - 1).grab_bag takes 2n - 1 time to run. Additionally, bag has size 2n - 1. This is important, because the next line iterates through bag and performs a constant time operation on each bag, so the iterator also takes 2n - 1 time to run. Finally, we concatenate each of these 2n - 1 items onto bag. So, we have three operations running in O(2n - 1) time, which means that grab_bag runs in O(32n - 1) = O(1.52n) = O(2n) time as well.

