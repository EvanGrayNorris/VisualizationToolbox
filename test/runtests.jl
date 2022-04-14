import Pkg
Pkg.activate(".")
using VisualizationToolbox
using Test
using Plots

@testset "VisualizationToolbox.jl" begin
    fibril_data = rand(100,100)
    #check that plot_fibrils is spitting out a plot using gr, plotly, or pyplot backend
    @test typeof(VisualizationToolbox.plot_fibrils(fibril_data)) == Plots.Plot{Plots.GRBackend} || typeof(VisualizationToolbox.plot_fibrils(fibril_data)) == Plots.Plot{Plots.PlotlyJSBackend()} || typeof(VisualizationToolbox.plot_fibrils(fibril_data)) == Plots.Plot{Plots.PyPlotBackend()}
end
