### A Pluto.jl notebook ###
# v0.14.0

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

# ╔═╡ 0502b791-fcf4-4cf7-9788-aa966b8e3307
begin
	import Pkg
	Pkg.activate(mktempdir())
	Pkg.add([
			Pkg.PackageSpec(url="https://github.com/paulgb/PenPlots.jl"),
			])
	Pkg.add("PlutoUI")
	using PenPlots
	using Random
	using Base.Iterators
	using PlutoUI
end

# ╔═╡ 7573514a-eb19-4fa6-9eb1-65e2de93e268
md"
Seed: $(@bind seed NumberField(1:100000))

Big Period: $(@bind big_period NumberField(1:100, default=7))

Small Period: $(@bind small_period NumberField(1:100, default=4))

Outer Radius: $(@bind radius NumberField(1:0.1:10, default=5))
"

# ╔═╡ 0bf0ad83-0632-4cdc-bb2f-f14dffc245cf
begin
	noise = random_vector_matrix(MersenneTwister(seed), big_period, small_period)
	
	map(0:0.004:1) do j
		r = 1 + perlin_noise(noise, Point(j*big_period, 0))
		center = radius * frac_rotation(j) * unitvec * r

		Path(map(0:0.01:1) do i
			r = 1 + perlin_noise(noise, Point(i*big_period, j*small_period))
			center + frac_rotation(i) * unitvec * r
	  end)
	end
end

# ╔═╡ Cell order:
# ╠═0502b791-fcf4-4cf7-9788-aa966b8e3307
# ╠═7573514a-eb19-4fa6-9eb1-65e2de93e268
# ╠═0bf0ad83-0632-4cdc-bb2f-f14dffc245cf
