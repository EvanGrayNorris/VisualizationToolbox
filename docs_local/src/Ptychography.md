# Ptychography (UNDER DEVELOPMENT)
The available visualization functions for Ptychography are:
```@contents
```
```@meta
CurrentModule = VisualizationToolbox.Ptychography
```
Components of the object tensor can be plotted using the plot_component function.
```@docs
plot_component(;component::Array,type::String,color_gradient=:gray,resolution::Integer=200)
```
interim text
```@docs
multi_component(N, component, type, color_gradient, resolution; colorbar_ticks = [[1,25,50,75,100],["0","0.25","0.5","0.75","1"]], colorbar_limits = [0, 2*pi], layout_grid = [2,2])
```

```@index
```