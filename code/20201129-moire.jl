### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 9ec05b54-328b-11eb-0554-9d8872970adc
using PlutoUI

# ╔═╡ acef3b14-328b-11eb-2f8b-79be3caeef3c
using PenPlots

# ╔═╡ ceab68fc-328b-11eb-01d1-53426ea64b89
@bind a Slider(1:0.00001:1.005)

# ╔═╡ fb2ec72c-328b-11eb-0c8f-5f573405f5c5
@bind b Slider(1:0.00001:1.005)

# ╔═╡ 0769cb0c-328c-11eb-1a66-3ded0d3b7de5
@bind spirals Slider(1:100)

# ╔═╡ afbce6f2-328b-11eb-05f9-691ba92f2f43
points(y) = Path([
	frac_rotation((2/3) * i * y) * unitvec * i
	for i in 0:spirals
])

# ╔═╡ bb68c0be-328b-11eb-3b0b-f32658b69912
PenPlot([points(a)], [points(b)])

# ╔═╡ Cell order:
# ╠═9ec05b54-328b-11eb-0554-9d8872970adc
# ╠═acef3b14-328b-11eb-2f8b-79be3caeef3c
# ╠═ceab68fc-328b-11eb-01d1-53426ea64b89
# ╠═fb2ec72c-328b-11eb-0c8f-5f573405f5c5
# ╠═0769cb0c-328c-11eb-1a66-3ded0d3b7de5
# ╠═afbce6f2-328b-11eb-05f9-691ba92f2f43
# ╠═bb68c0be-328b-11eb-3b0b-f32658b69912
