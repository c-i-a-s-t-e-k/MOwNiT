using DataFrames
using Plots

function f1(x)
    return x^8 - 8*x^7 + 28*x^6 - 56*x^5 + 70*x^4 - 56*x^3 + 28*x^2 -8*x + 1
end

function f2(x)
    return (((((((x - 8)* x + 28) * x - 56) * x + 70) * x - 56) * x + 28) * x - 8)* x + 1
end

function f3(x)
    return (x - 1)^8
end

function f4(x)
    return exp((8 * log(abs(x-1))))
end
function main()

    floatVector::Vector{Float32} = range(0.99, stop=1.01, length=101)
    doubleVector::Vector{Float64} = range(0.99, stop=1.01, length=101)
    bigDoubleVector::Vector{BigFloat} = range(0.99, stop=1.01, length=101)

    dfFloat = DataFrame(F1 = [f1(x) for x in floatVector], F2 = [f2(x) for x in floatVector], F3 = [f3(x) for x in floatVector], F4 = [f4(x) for x in floatVector])
    # println(dfFloat, "\n\n\n")
    dfDouble = DataFrame(F1 = [f1(x) for x in doubleVector], F2 = [f2(x) for x in doubleVector], F3 = [f3(x) for x in doubleVector], F4 = [f4(x) for x in floatVector])
    # println(dfDouble, "\n\n\n")
    dfBigDouble = DataFrame(F1 = [f1(x) for x in bigDoubleVector], F2 = [f2(x) for x in bigDoubleVector], F3 = [f3(x) for x in bigDoubleVector], F4 = [f4(x) for x in bigDoubleVector])
    # println(dfBigDouble, "\n\n\n")
    # println([f1(x) for x in bigDoubleVector])
    # println(bigDoubleVector[51])

    x = bigDoubleVector

    plot(x, map(f3, x), label="f3", seriestype=:scatter)
    xlabel!("x")
    ylabel!("f3(x)")
    
    # plot!(x, map(f2, x), label="f1", seriestype=:scatter)
    # plot!(x, map(f3, x), label="f1", seriestype=:scatter)
    # plot!(x, map(f4, x), label="f1", seriestype=:scatter)
    

end

main()