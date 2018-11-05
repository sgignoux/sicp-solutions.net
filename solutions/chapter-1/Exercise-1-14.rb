


def t1(n)
    if (n>0)
        2*n+1
    else
        1
    end
end

def t2x(n)
    if(n == 0)
        0
    else
        (n*n+7*n)/5+1
    end
end

def t2(n)
    if (n > 0)
        (0..n/5.floor+1).map{ |i| 
            puts "t1(" + (n-5*i).to_s + ") = " + t1(n-5*i).to_s
            t1(n-5*i) }.inject(0){|sum,x| sum + x } + n/5 + 1
    else
        1
    end
end

def t3(n)
    puts "t3(" + n.to_s + ")"
    (0..n/10.floor+1).map{ |i| 
        puts "t2(" + (n-10*i).to_s + ") = " + t2(n-10*i).to_s
        t2(n-10*i) }.inject(0){|sum,x| sum + x } + n/10 + 1
end

puts(t3(21))
puts
puts(t2(21))