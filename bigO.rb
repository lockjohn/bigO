def example(n)
	return 1 if n == 0
	n.times { p n } if n.odd?
	example(n-1) * example(n-1)
end


def example11(n)
    n.times do |i|
        j=1
        while j < n 
            j*=2
        end
    end
end

#1
def add(a, b)
  if a > b
    return a + b
  end

  a - b
end

#2 
def print_arr_1(arr)
  arr.each do |idx|
    puts idx
  end
end

#3 
def print_arr_2(arr)
  arr.each_with_index do |el, idx|
    break if idx == arr.length/2 - 1
    puts el
  end
end

#4
def print_arr_3(arr)
  arr.each do |el|
    break if el == arr.length/2 - 1
    puts el
  end
end

#5
def print_arr_4(arr)
  arr.each do |el|
    break if el == arr.length/2 - 1
    puts el
  end

  arr.each_with_index do |el, idx|
    puts el if idx % 3 == 0
  end

  puts arr.last
end

#6
def search(arr, target)
  arr.each_with_index do |el, idx|
    return idx if el == target
  end
end

#7 calls search above
def searchity_search(arr, target)
  results = []
  arr.each do |el|
    results << search(arr, target + el)
  end

  results  
end

#8
def searchity_search_2(arr, target)
  results = []
  arr.each do |el|
    results << search(arr, el)
  end

  results  
end

#1
let iterative_1 = (n, m) => {
  let notes = ["do", "rei", "mi", "fa", "so", "la", "ti", "do"];

  for (var i = 0; i < n; i++) {
    for (var j = 0; j < m; j++) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}

#2
let iterative_2 = (n) => {
  let notes = ["do", "rei", "mi", "fa", "so", "la", "ti", "do"];

  for (var i = 0; i < n; i++) {
    for (var j = i; j >= 0; j--) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}
#3
let iterative_3 = (n, m) => {
  let notes = ["do", "rei", "mi", "fa", "so", "la", "ti", "do"];

  let bigger = n > m ? n : m;
  let smaller = n <= m ? n : m;

  for (var i = 0; i < smaller; i++) {
    for (var j = i; j < bigger; j++) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}
#4 
def rec_mystery(n)
  return n if n < 5

  rec_mystery(n - 5)
end

#5
def rec_mystery_2(n)
  return 0 if n == 0

  rec_mystery_2(n/5) + 1
end

#6
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

#7 
class Array
  def grab_bag
    return [[]] if empty?
    bag = take(count - 1).grab_bag
    bag.concat(bag.map { |handful| handful + [last] })
  end
end
