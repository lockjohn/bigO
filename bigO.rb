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

#7
def searchity_search(arr, target)
  results = []
  arr.each do |el|
    results << search(arr, target + el)
  end

  results  
end

