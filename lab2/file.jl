function _dQhelper(i,j,X,Y,Y′,dQ)
    println("$i,$j")
    if dQ[i,j] != 0
        return dQ[i,j]
    elseif j==1
        println("\tj=1, i=$i, $((i+1)÷2)")
        dQ[i,j] = Y[(i+1)÷2]
        println("\tendl")
    elseif (i+j-2) ÷ 2 == (i-1) ÷ 2
        println("\tsecond, $(i)")
        dQ[i,j] = Y′[(i+1)÷2]
    else
        println("\tthird $((i+j+1+1)÷2), $((i+1)÷2)")
        dQ[i,j] = (_dQhelper(i+1,j-1,X,Y,Y′,dQ) - _dQhelper(i,j-1,X,Y,Y′,dQ))/(X[(i+j)÷2] - X[(i+1)÷2])
    end
    return dQ[i,j]
end

function CreateInterpolationHermitePolynominal(X, Y, Y′)
    n = length(X)
    differenceQuotients = zeros(n*2, n*2)
    _dQhelper(1,6,X,Y,Y′,differenceQuotients)
    print("funkcja zakończyła działanie\n")
    
    # return (x) -> 
    # begin
    #     res = differenceQuotients[1,1]
    #     product = (x - X[1])
    #     for i in 2:n
    #         res += product*differenceQuotients[i,i]
    #         product *= (x - X[i÷2])
    #     end
    #     return res
    # end
    pretty_table(differenceQuotients)
end

CreateInterpolationHermitePolynominal([1,2,3], [1, 4,9], [2, 4,6])
# println("f1(1)=$(f1(1)), f1(1.5)=$(f1(1.5)), f1(2)=$(f1(2))")

