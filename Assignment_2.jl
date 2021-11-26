# 1. TRAPEZOIDAL_RULE

function trapezoidal_rule_intergral(f, inf_interval, sup_interval, nums_sub_interval)
    a, b, n = inf_interval, sup_interval, nums_sub_interval
    h = (b-a)/n
    trap_sum = (f(a) + f(b))/2
    for i = 1 : n-1 
        ξ = a + i*h
        trap_sum += f(ξ)
    end 
    return h * trap_sum
end

# ----------------------------------------------------- 
# 2. RECTANGLE_RULE

function rectangle_rule_interval(f, inf_interval, sup_interval, nums_sub_interval)
    a = inf_interval
    b = sup_interval
    n = nums_sub_interval
    h = (b-a)/n
    rect_sum = 0
    for i = 0 : n - 1
        ξ = a + (2*i-1)*h/2
        rect_sum += f(ξ)
    end
    rect_rule_intergral = h * rect_sum
    return rect_rule_intergral
end
# ----------------------------------------------------- 

# 3. PLOTS

using Plots

inf_interval = 0
sup_interval = 8*π
num_sub_intervals = 30
h = (sup_interval - inf_interval)/num_sub_intervals

k(x) = x*sin(x)

# ----------------------------------------------------- 
## 3.1. Plot trapezoidal rule

# plot(x, xsin(x))
x_trap = inf_interval : 0.001 : sup_interval
y_trap= k.(x_trap)
plot(
    x_trap, y_trap, 
    label ="y = f(x)", xlabel = "x", ylabel = "y",
    legend = (:top),
    line = (:red, 2),
    title = "Illustration of the Trapezoidal rule"
)
# plot(points_trapRule_set, f_trap_points)
trap_points = inf_interval : h : sup_interval
f_trap_points = k.(trap_points)

# plot(trap_points, f_trap_points)
plot!(trap_points, f_trap_points, label = "", line = (:blue, 1.5))
for i = 1 : length(trap_points)
    plot!(
        [trap_points[i], trap_points[i]], 
        [0, f_trap_points[i]],
        label = "",
        line = (:blue, 1.5)
    )
end
# plot the straight line: y = 0
plot!(
    [inf_interval, sup_interval], [0, 0],
    line = (:blue, 1.5),
    label = ""
)
# ----------------------------------------------------- 
## 3.2. Plot rectangle rule

# plot(x, xsin(x))
x_rect = inf_interval : 0.001 : sup_interval
y_rect = k.(x_rect)
plot(
    x_rect, y_rect, 
    label ="y = f(x)", xlabel = "x", ylabel = "y",
    legend = (:top),
    line = (:red, 2),
    title = "Illustration of the Rectangle rule"
)

# plot rectangle 
rect_points = inf_interval : h : sup_interval
# plot vertical lines
for i = 1 : length(rect_points) - 1
    x_mid = (rect_points[i] + rect_points[i+1])/2
    f_ξ = k(x_mid)

    plot!(
        [rect_points[i], rect_points[i]], [0, f_ξ],
        label = "",
        line = (:blue, 1.5)
    )

    plot!(
        [rect_points[i], rect_points[i+1]], [f_ξ, f_ξ],
        label = "",
        line = (:blue, 1.5)
    )
    plot!(
        [rect_points[i+1], rect_points[i+1]], [f_ξ, 0],
        label = "",
        line = (:blue, 1.5)
    )
end

# plot the straight line: y = 0
plot!(
    [inf_interval, sup_interval], [0, 0],
    line = (:blue, 2),
    label = ""
)
