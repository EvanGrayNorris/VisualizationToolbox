import Pkg

Pkg.activate(raw".")
using Documenter
import VisualizationToolbox
using VisualizationToolbox.Ptychography

makedocs(
    sitename = "Visualization Toolbox Documentation",
    format = Documenter.HTML(),
    modules = [VisualizationToolbox],
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
