using ForwardDiff

function simple(x)
    w = sin.(x)
    return sum(x .* w)
end
ForwardDiff.gradient(simple, [1.0, 2.0, 1.0, 0.5])


elu(x) = x > 0 ? exp(-x) : 0

function complex_example(W, x)
    for idx = 1:10
        if idx > 5
            x = elu.(W * x)
        else
            x = W * x
        end
    end

    return sum(sqrt.(abs.(x)))
end
ForwardDiff.gradient(complex_example, [1.0, 2.0, 1.0, 0.5])


begin
    W = randn(4, 4)
    x = [1.0, 2.0, 1.0, 0.5]
    for idx in 1:1000
        dx = ForwardDiff.gradient(param_to_optimize -> complex_example(W, param_to_optimize), x)
        x .-= dx * 0.001

        @show complex_example(x)
    end
end
