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



