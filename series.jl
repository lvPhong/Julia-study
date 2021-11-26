using Plots

# g-series
# G = sum(p^k)(k=1:inf)
# Possible keywords are:
# :right, :left, :top, :bottom, 
# :inside, :best, :legend, :topright,
# :topleft, :bottomleft, :bottomright
function gSeries(p::Real)
    if abs(p) > 1.0
        return error("p must be in (-1, 1)")
    end
    k = 1:1000
    g = p .^ (k)
    G = 1 / (1 - p)
    plot(
        k, cumsum(g),
        title = "g-series with p = $p",
        label = "finite sum",
        legend = (:best),
        xlabel = "Index",
        ylabel = "Sum",
        line = (1.5, "blue")
    )
    plot!(
        [0, length(k)], [G, G],
        label = "infinite sum",
        line = (1.5, "red")
    )
    savefig("gSeries.png")
end

gSeries(0.99)

# ----------------------------------------------------------------
# p-series
# P = sum(1/n^p)
function pSeries(p::Real)
    n = 1:500
    pSeries = cumsum(n .^ (-p))
    P = π^2 / 6
    plot(
        n, pSeries,
        title = "g-series with p = $p",
        label = "finite sum",
        legend = (:best),
        xlabel = "Index",
        ylabel = "Sum",
        line = (1.5, "blue")
    )
    plot!(
        [0, length(n)], [P, P],
        label = "infinite sum",
        line = (1.5, "red")
    )
    savefig("pSeries.png")
end

pSeries(2.0)