module VisualizationToolbox
    module Ptychography
        using Plots
        export plot_component, plot_fibrils
        """
            plot_component(;component::Array,type::String,color_gradient=:gray,resolution::Integer=200)

        Return a heatmap of "component"
        The "component" input must have the Array type, but behaves differently if a 2D or 3D array is supplied

            a 2D array will result in a single heatmap of the provided component with specified type

            a 3D array will plot an array of heatmaps for each component in the array, with the third index specifying the current component i.e. component[:,:,i] corresponds to the ith component
        
        the "type" input must be a string and chosen from the following:
        
            "phase": produce a heatmap of the phase of current component
        
            "magnitude" produce a heatmap of the magnitude of current component
        
            "angle" produce a heatmap of the angle
        Additional plot attributes can be input as well

            color_gradient: sets the colorscheme of the heatmap, a custom gradient can be set with cgrad([:color1,:color2,:color3,...:colorN], 256)

            resolution: set the DPI of the plot, default: 200
            
        !!! note "Angle Input"
                the angle type only supports 2D input, an error will be thrown for 3D arrays input with the angle type

        For a multi-component the resulting image should look like:
        ![plot example](./assets/images/multiphase_test.png)
        """
        function plot_component(;component::Array,type::String,color_gradient=:grays,resolution::Integer=200)
            mode = "initialize"
            N_components = 0
            if length(size(component)) == 3
                println("Plotting $(size(component)[3]) components")
                mode = "multi"
                N_components = size(component)[3]
                plot = multi_component(N_components, component, type, color_gradient, resolution, colorbar_ticks = [[1,25,50,75,100],["0","pi/2","pi","3pi/2","2pi"]], colorbar_limits = [0, 2*pi], layout_grid = [2,2])
            elseif length(size(component)) == 2
                println("Plotting single component")
                mode = "single"
                N_components = 1
            else
                throw("component must be either a 2D array for single component plotting or a 3D array for multi-component plotting")
            end

            return [mode, N_components, plot]
        end 
        """
            plot_fibrils(;fibril_dataset)

        return a plot of fibrils defined by the input dataframe
        """
        function plot_fibrils(;fibril_dataset)
            return "blank"
        end

        """
            multi_component(N, component, type, color_gradient, resolution; colorbar_ticks = [[1,25,50,75,100],["0","pi/2","pi","3pi/2","2pi"]], colorbar_limits = [0, 2*pi], layout_grid = [2,2])

        internal function called by plot_components, handles the plot generation of multiple components
        """
        function multi_component(N, component, type, color_gradient, resolution; colorbar_ticks = [[1,25,50,75,100],["0","\$\\pi/2\$","\$\\pi\$","\$3\\pi/4\$","\$2\\pi\$"]], colorbar_limits = [0, 2*pi], layout_grid = [2,2])
            #build a custom colorbar
            cb = zeros(100,2)
            for i = 1:100
                cb[i,1] = (1/N) * (i-1); cb[i,2] = cb[i,1];
            end
            color_bar_plot = heatmap(cb, c=color_gradient, colorbar = :none, yticks = (colorbar_ticks[1], colorbar_ticks[2]), xticks=:none)
            
            plots = []
            for i = 1:N
                p = heatmap(component[:,:,i],
                c = color_gradient,
                colorbar=:none,
                clims = (colorbar_limits[1],colorbar_limits[2]),
                leg = false,
                dpi = resolution,
                xticks= :none,
                yticks = :none,
                wsize = (800,800))
                push!(plots, p)
            end
            l = @layout[grid(2,2) a{0.07w}]
            p = plot(plots...,
            color_bar_plot,
            layout = l,
            dpi = resolution)
            
            return p
        end


    end
    

end
