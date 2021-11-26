using Plots

function throwBall(h::Real, v0::Real, θ::Real, times = 1.0, g = 9.8)
    α = θ*π/180
    t = 0:(times/1000):times
    x = v0*cos(α).*t
    y = v0*sin(α).*t - (1/2*g)*(t.^2) .+ h
    # plot(
    #     x, y,
    #     title = "Ball Trajectory",
    #     label = "",
    #     xlabel = "Distance(m)",
    #     ylabel = "Ball Height(m)",
    #     line = (1.5, "blue")
    # )
    # plot!(
    #     [0, maximum(x) + 0.5], [0, 0],
    #     line = (:dash, "black"),
    #     label = ""
    # )
    return x, y
end

function throwBallPlot(h::Real, v0::Real, θ::Real, times = 1.0, g = 9.8)
    x, y = throwBall(h, v0, θ)
    plot!(
        x, y,
        title = "Ball Trajectory",
        label = "",
        xlabel = "Distance(m)",
        ylabel = "Ball Height(m)",
        line = (1.5, "blue")
    )
    plot!(
        [0, maximum(x) + 0.5], [0, 0],
        line = (:dash, "black"),
        label = ""
    )
end 

throwBallPlot(1.5, 4.0, 45.0)
savefig("throwBall.png")