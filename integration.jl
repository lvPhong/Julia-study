using Plots


function rectangle(f, infInterval, supInterval, numSubInterval)
    a, b, n = infInterval, supInterval, numSubInterval
    integralSum = 0
    h = abs(b - a) / n
    for i = 1:n
        # x_i = a + i*h
        # ξ = (x_(i-1) + x_i)/2
        ξ = a + (i - 1 / 2) * h
        integralSum += f(ξ) * h
    end
    return integralSum
end

function trapezoidal(f, infInterval, supInterval, numSubInterval)
    a, b, n = infInterval, supInterval, numSubInterval
    h = abs(b - a) / n
    integralSum = (f(a) + f(b)) / 2
    for i = 1:n
        # x_i = a + i*h
        # ξ = x_(i-1)
        ξ = a + (i - 1) * h
        integralSum += f(ξ)
    end
    return integralSum * h
end

ϕ(x) = x * sin(x)
a = 0
b = π
n = 30
rectSum = [rectangle(ϕ, a, b, i) for i = 1:n]
trapSum = [trapezoidal(ϕ, a, b, i) for i = 1:n]

plot!(
    1:n, rectSum,
    xlabel = "n",
    ylabel = "integration",
    label = "rectSum",
    line = (1.5, "blue")
)

plot!(
    1:n, trapSum,
    label = "trapSum",
    line = (1.5, "green")
)

plot!(
    [1, n], [π, π],
    line = (1.5, "red"),
    label = "∫f(x)dx"
)
savefig("integration-rule.png")