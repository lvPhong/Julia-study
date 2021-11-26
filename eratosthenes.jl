function eratosthenes(n::Int)
    vect = Vector{Int}([i for i = 2:n])
    for k = 2:floor(Int, sqrt(n))
        # deleteat!(vect, findall(x -> (x > k && mod(x, k) == 0), vect))
        deleteat!(vect, findall(x -> (x > k && mod(x, k) == 0), vect))
    end
    return vect
end

function properDivisors(num::Int)
    n = abs(num)
    proDiv = [1]
    for i = 2:floor(Int, sqrt(n))
        if i^2 == n
            push!(proDiv, i)
        else
            push!(proDiv, i, n÷i)
        end
    end
    return proDiv
end

function sumProperDivisors(num::Int)
    return sum(properDivisors(num))
end

function isPerfect(num::Int)
    return num == sumProperDivisors(num)
end

