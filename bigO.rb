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

