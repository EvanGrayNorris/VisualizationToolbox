import Pkg
Pkg.activate(".")
using VisualizationToolbox
using Test
using Plots

A = VisualizationToolbox.Ptychography.plot_component(component=2*pi .* rand(100,100,4),type="phase", color_gradient=cgrad([:blue,:cyan,:red,:lightsalmon,:blue]))
show(A[3])
png(raw"docs_local\src\assets\images\multiphase_test.png")

@testset "VisualizationToolbox.jl" begin

end

docs_local\src\assets\images