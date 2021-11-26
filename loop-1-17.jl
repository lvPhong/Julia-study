using Plots
using LinearAlgebra
using Random
using DelimitedFiles
using CSV, DataFrames


# 1.a 
function nExp(x::Float64, n::Integer)
    term = 1
    nSum = 1
    for i = 1:n
        # nSum += term
        # term *= x/(i+1)
        term *= x / i
        nSum += term
    end
    return nSum
end

# 1.b
function smallest_N_Exp(x::Float64, accurately = 10^-9)
    nSum = 1
    a_n = x
    expX = exp(x)
    n = 1
    while abs(expX - nSum) >= accurately
        nSum += a_n
        a_n *= x / (n + 1)
        n += 1
    end
    return (n, nSum, exp(x))
end

# 2.a
function mySumE(N::Integer)
    a_n = 1
    mySum = 1
    for n = 1:N
        a_n *= (n + 2) / (n * (n + 1))
        mySum += a_n
    end
    return mySum
end

# 3.
function myGcd(a::Int, b::Int)
    if b == 0
        return a
    else
        return myGcd(b, a % b)
    end
end

# 4.a
function properDivisors(n::Int)
    divisorsList = [1]
    for i = 2:floor(Int, sqrt(n))
        if mod(n, i) == 0
            if i^2 == n
                push!(divisorsList, i)
            else
                push!(divisorsList, i, n ÷ i)
            end
        end
    end
    return sort(divisorsList)
end

function sumProperDivisors(n::Int)
    return sum(properDivisors(n))
end

function isPerfect(n::Int)
    return sumProperDivisors(n) == n
end

# 5. 
function isFriendly(a::Int, b::Int)
    return sumProperDivisors(a) == b && sumProperDivisors(b) == a
end

# 6.
function isPrime(n::Int)
    if n < 2
        return false
    elseif n in [2, 3]
        return true
    else
        # n ≥ 4
        if mod(n, 6) in [1, 5]
            for i = 5:2:floor(Int, sqrt(n))
                if mod(n, i) == 0
                    return false
                end
            end
            return true
        else
            # mod(n, 6) in [0, 2, 3, 4]
            return false
        end
    end
end

# 7.
function findMax(v::Vector)
    max = v[1]
    for i = 2:length(v)
        if v[i] > max
            max = v[i]
        end
    end
    return max
end

# 8.

# 9.
function nDigits(n::Int)
    digits = []
    num = abs(n)
    while num > 0
        digit = mod(num, 10)
        push!(digits, digit)
        num ÷= 10
    end
    return reverse(digits)
end

function numberOfDigits(n::Int)
    return length(nDigits(n))
end

# 10.
function isDivisibleBy3(n::Int)
    return mod(sum(nDigits(n)), 3) == 0
end

# 11.
function isDivisibleBy11(n::Int)
    digits = nDigits(n)
    minusDigits = 0
    # signDigit = 1
    for i = 1:length(digits)
        # minusDigits += digits[i]*signDigit
        # signDigit *= -1
        minusDigits += digits[i] * (-1)^i
    end
    return mod(abs(minusDigits), 11) == 0
end

# 12.
function factorize(n::Int)
    primesDiv = []
    num = abs(n)
    while mod(num, 2) == 0
        push!(primesDiv, 2)
        num ÷= 2
    end
    for i = 3:2:floor(Int, sqrt(num))
        while mod(num, i) == 0
            push!(primesDiv, i)
            num ÷= i
        end
    end
    if num > 1
        push!(primesDiv, num)
    end
    return primesDiv
end

# 13.
function babylonian(number, steps = 15::Int)
    S = abs(number)
    xn = S
    for _ = 1:abs(steps)
        xn = (xn + S / xn) / 2
    end
    return xn
end

# 14.
function stirling_factorial(n::Int, θ = 10^(-3))
    P = √(2 * π * n) * exp(θ / (12 * n))
    e = exp(1.0)
    for _ = 1:abs(n)
        P *= n / e
    end
    return P
end

# 15.
function binarize(n::Int, base::Int)
    num = abs(n)
    bin = []
    if base < 2
        return println("base must be larger or equal than 2")
    end
    while num > 0
        r = mod(num, base)
        push!(bin, r)
        num ÷= base
    end
    return reverse(bin)
end

function bin(n::Int, base::Int)
    return join(binarize(n, base))
end

# 16.a
function bankBalance(nYears::Int, initialBalace::Real, rate::Real)
    balance = initialBalace
    for _ = 1:nYears
        balance *= (1 + rate)
    end
    return balance
end
# 16.b
function reachedTime(balance::Real, rate::Real, initialBalace::Real)
    return ceil(log(balance / initialBalace) / log(1 + rate))
end

# 17.
function uniq(v::Vector)
    uniq_ = []
    for element in v
        if !(element in uniq_)
            push!(uniq_, element)
        end
    end
    return uniq_
end