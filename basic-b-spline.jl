using BasicBSpline
k = Knots([1,3,5,2,3])
println(k)
k[3]
kk = Knots([1,2,3]) + Knots([2,4,5])
println(kk)
println(3kk)
print(unique(kk))
unique([1,2,2,3,3,3])
k = Knots([1,2,2,3])
𝔫(k,3)
#---



p = 2
k = Knots([1,3,5,6,8,9])
P=BSplineSpace(p,k)
dim(P)
using Plots
gr()
p = 2
k = Knots(1:8)
P = BSplineSpace(p,k)
plot([t->BSplineBasis₊₀(i,P,t) for i in 1:dim(P)], 1,8)
plot([t->BSplineBasis′₊₀(i,P,t) for i in 1:dim(P)], 1,8)
dim(P)
BSplineSupport(3,P)
p = 2
k = Knots(1:8) + 2Knots([1,8])
P = BSplineSpace(p,k)
plot(t->sum(BSplineBasis₊₀(i,P,t) for i in 1:dim(P)), 1,8)
plot(t->sum(BSplineBasis(i,P,t) for i in 1:dim(P)), 1,8, ylims=(0,1.04))
plot(t->sum(BSplineBasis₋₀(i,P,t) for i in 1:dim(P)), 1,8)
##

𝒫
𝒫 #(scrP)
⊆ #(subseteq)
⊈ #(nsubseteq)
P1 = 𝒫(1,Knots([1,3,5,8]))
P2 = 𝒫(1,Knots([1,3,5,6,8,9]))
P3 = 𝒫(2,Knots([1,1,3,3,5,5,8,8]))
P1 ⊆ P2 # true
P1 ⊆ P3 # true
P2 ⊆ P3 # false
P2 ⊈ P3 # true
P1 = 𝒫(1,Knots([1,3,5,8]))
P2 = 𝒫(1,Knots([1,3,5,6,8,9]))
P3 = 𝒫(2,Knots([1,1,3,3,5,5,8,8]))
plot(
    plot([t->BSplineBasis₊₀(i,P1,t) for i in 1:dim(P1)], 1, 9, ylims=(0,1.05), legend=false),
    plot([t->BSplineBasis₊₀(i,P2,t) for i in 1:dim(P2)], 1, 9, ylims=(0,1.05), legend=false),
    plot([t->BSplineBasis₊₀(i,P3,t) for i in 1:dim(P3)], 1, 9, ylims=(0,1.05), legend=false),
    layout=(3,1),
    link=:x
)
##

A12 = BasicBSpline.ChangeOfBasis(P1,P2)
A13 = BasicBSpline.ChangeOfBasis(P1,P3)
plot(
    plot([t->BSplineBasis₊₀(i,P1,t) for i in 1:dim(P1)], 1, 9, ylims=(0,1.05), legend=false),
    plot([t->sum(A12[i,j]*BSplineBasis₊₀(j,P2,t) for j in 1:dim(P2)) for i in 1:dim(P1)], 1, 9, ylims=(0,1.05), legend=false),
    plot([t->sum(A13[i,j]*BSplineBasis₊₀(j,P3,t) for j in 1:dim(P3)) for i in 1:dim(P1)], 1, 9, ylims=(0,1), legend=false),
    layout=(3,1),
    link=:x
)
##


P1 = 𝒫(1,Knots([0,0,1,1]))
P2 = 𝒫(1,Knots([1,1,2,3,3]))
n1 = dim(P1) # 2
n2 = dim(P2) # 3
𝒂 = [[i, j] for i in 1:n1, j in 1:n2]  # n1 × n2 array of d̂ array.
M = BSplineManifold([P1, P2], 𝒂)
Mapping(M, [1.0,1.0])
P1′ = 𝒫(2,Knots([0,0,0,1,1,1]))
P2′ = 𝒫(1,Knots([1,1,2,1.45,3,3]))
P1 ⊆ P1′
P2 ⊆ P2′
M′ = Refinement(M, [P1′, P2′])
##
≈ #\approx
1.0 ≈ nextfloat(1.0)
nextfloat(1.0)
Mapping(M, [0.82,1.8]) ≈ Mapping(M′, [0.82,1.8])
typeof(M)
typeof(k)
typeof(1.0)
typeof([1,2])
M.controlpoints
M.bsplinespaces
k.vector
