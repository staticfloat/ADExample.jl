using ForwardDiff

# Function with very simple to calculate derivative
function simple(x)
    return x*2 + 5
end
ForwardDiff.derivative(simple, 1.0)


# Function with more complex derivative
function more_complicated(x)
    return sin(2*x) + cos(x)
end
ForwardDiff.derivative(more_complicated, 1.0)


# Function showing control flow
function control_flow(x)
    if x > 0.0
        return x*2
    else
        return x*4
    end
end
ForwardDiff.derivative(control_flow, 1.0)
ForwardDiff.derivative(control_flow, -1.0)


# Function showing much more complex control flow
function loops_and_dicts(x)
    coeffs = Dict(
        "x is small" => 2,
        "x is large" => 4,
        "x is huge" => 10,
    )

    function categorize(x)
        if x < 1
            return "x is small"
        elseif x < 5
            return "x is large"
        else
            return "x is huge"
        end
    end

    while x < 10
        println(x)
        x = x * coeffs[categorize(x)]
    end
    println(x)
    return x
end
ForwardDiff.derivative(loops_and_dicts, 0.5)
