include("loop-1-17.jl")
include("matrix-18-22.jl")
include("magicSquare-23.jl")


# 1.a
# print(nExp(1.0, 30))

# 1.b
# print(smallest_N_Exp(2.0))

# 2.
# print(mySumE(100))

# 3.a
# print(myGcd(1000, 25))

# 3.b
# nSize = 100
# v = rand(1:1000, nSize)
# A = zeros(Int, nSize, nSize)
# for i = 1:nSize
#     for j = 1:nSize
#         A[i, j] = myGcd(v[i], v[j])
#     end
# end
# print(A)

# 4.a 
# num = 28
# println("n = ", num)
# println(properDivisors(num))
# println(sumProperDivisors(num))
# println(isPerfect(num))

# 4.b
# upper_lim = 10^7
# perfect_nums_list = filter(isPerfect, 1:upper_lim)
# println(perfect_nums_list)

# 5.
# println("isFriendly(220, 284):", isFriendly(220, 284))
# upper_lims = 10^5
# for i = 1:upper_lims - 1
#     for j = i+1 : upper_lims
#         if isFriendly(i, j) == true
#             println(i, "\t", j)
#         end
#     end
# end

# 6.
# N = 10^3
# primes_list_ = filter(isPrime, 2:N)
# writedlm("all-primes-less-than-one-billion.txt", primes_list_)

# 7.
# v = rand(Int, 100)
# v = rand(1:10^8, 100)
# println("v = ", v)
# println("max(v) = ", findMax(v))

# 8.

# 9.
# n = 123
# println("n = ", n)
# println("number of n's digits :", numberOfDigits(n))

# 10.

# 16.c
# DEPOSIT_PLAN_YEARS = 5
# DEPOSIT_PLAN_SIX_MONTHS = DEPOSIT_PLAN_YEARS * 2
# DEPOSIT_PLAN_QUARTERS = DEPOSIT_PLAN_YEARS * 4
# DEPOSIT_PLAN_MONTHS = DEPOSIT_PLAN_YEARS * 12

# SIX_MONTHS_INTEREST_RATE = 4 / 100
# QUARTERS_INTEREST_RATE = 2 / 100
# MONTHS_INTEREST_RATE = 0.67 / 100

# balance_for_years_plan = bankBalance(DEPOSIT_PLAN_YEARS,
#     INITIAL_BALANCE,
#     INTEREST_RATE)

# balance_for_six_months_plan = bankBalance(DEPOSIT_PLAN_SIX_MONTHS,
#     INITIAL_BALANCE,
#     SIX_MONTHS_INTEREST_RATE)

# balance_for_quarters_plan = bankBalance(DEPOSIT_PLAN_QUARTERS,
#     INITIAL_BALANCE,
#     QUARTERS_INTEREST_RATE)

# balance_for_months_plan = bankBalance(DEPOSIT_PLAN_MONTHS,
#     INITIAL_BALANCE,
#     MONTHS_INTEREST_RATE)

# 21.
# zMax1 = 1.0
# c = complex(-0.297491, 0.641051)
# N1 = 100
# juliaImage(zMax1, c, N1)
# savefig("julia-set-1.png")

# zMax2 = 0.35
# N2 = 250
# juliaImage(zMax2, c, N2)
# savefig("julia-set-2.png")

# 23.
# open("magicSquare.txt", "a") do f
#     for i = 3:10
#         write(f, "n = $i \n")
#         writedlm(f, magic(i))
#         write(f, "-------------------------------------\n")
#     end
# end

# 24.
