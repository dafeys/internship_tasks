def zeros(n)
  res = 1
  for i in 1..n
    res *= i
  end

  res_str = res.to_s

  zeros = 0
  i = res_str.length - 1
   while i >=0 && res_str[i] == '0'
    zeros += 1
    i -=1
   end
  
   return zeros
end


def zeros(n)
  trailing_zeros = 0
  while n > 0
    n /= 5
    trailing_zeros += n
  end

  return trailing_zeros
end


def zeros(n)
	n < 5 ? 0 : (n / 5) + zeros(n / 5)
end


p zeros(6)
puts
p zeros(12)