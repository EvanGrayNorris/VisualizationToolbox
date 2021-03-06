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

#bandaid solution for hosting documentation on github pages, will be replaced with deploydocs() later
cp(raw"docs_local\build","docs",force=true)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "https://github.com/ResidentEvan/VisualizationToolbox.git"
)=#
