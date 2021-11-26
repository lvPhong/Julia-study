using Plots


function sombrero(x::Real, y::Real)
    u = √(x^2 + y^2)
    if iszero(u)
        return 1.0
    else
        return sin(u) / u
    end
end

x = -6:0.01:6
y = -6:0.01:6
z = [sombrero(x[i], y[j]) for i = 1:length(x), j = 1:length(y)]
plot(
    x, y, z,
    st = :surface,
    label = "z = sin(√(x^2+y^2))/√(x^2+y^2)",
    xlabel = "x",
    ylabel = "y"
)
savefig("sombrero.png")