# Change the initial velocity of the ball to a different value, compare and
# plot two trajectories.

using Plots
# Initial height of ball at release = 1.5m;
h = 1.5

#Gravitational acceleration = 9.8m/s2;
g = 9.8

# Velocity of ball at release
velocity = 1:1.0:2.0

# Angle of the velocity vector at time of release = 45 degrees.
angle = 0:45.0:90.0

# Make a time vector that has 1000 linearly spaced values between 0 and 1
t = 0:0.0001:1

for v in velocity
    for θ in angle
        # x(t) =vcos(θπ/180)*t
        x = v * cos(θ * π / 180) * t 
        # y(t) =h+vsin(θπ/180)t−1/2gt^2
        y = -g / 2 * t .^ 2 .+ h + v * sin(θ * π / 180) * t
        #plot(x,y)
        plot!(
        x,
        y,
        xlim = (0.0,maximum(x)+1),
        ylim = (minimum(y)-3, maximum(y)+1),
        xticks = 0.0:0.5:(maximum(x)+1),
        yticks = floor((minimum(y)-3)):0.5:ceil((maximum(y)+1)),
        xlabel = "Distance (m)",
        ylabel = "Ball Height (m)",
        title = "Ball Trajectory",
        label = string("v = ",v),
        )
        plot!([0.0, maximum(x) + 1.0], [0.0, 0.0], line = (:dash, :black), label = "")
    end
end
savefig("Throw Ball many times.png")
