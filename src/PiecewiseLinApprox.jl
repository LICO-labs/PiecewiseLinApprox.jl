module PiecewiseLinApprox

using Calculus
using CDDLib
using ForwardDiff
using GeneralizedGenerated
using Polyhedra
using Roots

import Base.-, Base.+, Base.show

export Linearize, LinearBounding, SimultaneousLin
export Absolute, Relative, Best, Under, Over, HeuristicLin, ExactLin
export isContinuous, breakpoints

include("strucDef.jl")
include("utilities.jl")
include("convexConcaveSplit.jl")
include("corridorFromInfo.jl")


include("convexCorridor.jl")
include("heuristic.jl")

include("oRourke.jl")
include("exactPiece.jl")

include("exactMethod.jl")

include("linearizeDispatch.jl")
include("bounding.jl")
include("simultaneousLin.jl")


end # module
