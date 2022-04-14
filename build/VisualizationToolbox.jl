module VisualizationToolbox

# Write your package code here.

    module fibril_plotter
        using Plots, Gtk
        #define public function
        export plot_fibrils

        function help()
            println("Function for plotting a grid of fibrils")
        end

       function plot_fibrils(;fibril_data::Array{Float64, 2})
            
            heatmap(fibril_data)
            png(raw"C:\Users\evang\Pictures\test.png")
       end

    end

end
