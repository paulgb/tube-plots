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

# ╔═╡ fb47655c-3c9a-11eb-11bc-75eeda7b33df
using PenPlots

# ╔═╡ 60eb8f14-3c9b-11eb-1bc4-b92eddd8d877
using Base.Iterators

# ╔═╡ b4f1df46-3c9b-11eb-1632-1b05ff6d4a15
using PlutoUI

# ╔═╡ b7bf59b0-3c9b-11eb-355b-6b36463f5ae5
using Random

# ╔═╡ 061863dc-3c9b-11eb-0cf0-07ec1fbd7bab
function random_shape(rng)
	n = rand(rng, 2:12)
	Path([
			frac_rotation(i/n) * unitvec * (rand(rng) + 1)
			for i in 1:n
	])
end

# ╔═╡ 50c3adce-3c9b-11eb-3356-5d7ae9d09263
function snowflake(seed)
	rng = MersenneTwister(seed)
	shapes = [
		Point(rand(rng) * 15, rand(rng) * 3) + random_shape(rng)
		for _ in 1:10
	]
	collect(flatten([
				p * (frac_rotation(i/6) * shapes)
				for p in [Point(1, 1), Point(-1, 1)]
				for i in 1:6
	]))
end

# ╔═╡ bc0fb8de-3c9b-11eb-33c4-3d40170b837a
@bind seed NumberField(1:100000)

# ╔═╡ a80a42dc-3c9b-11eb-24b1-c1bf60f73344
PenPlot(
	snowflake(seed*2),
	snowflake(seed*2+1)
)

# ╔═╡ Cell order:
# ╠═fb47655c-3c9a-11eb-11bc-75eeda7b33df
# ╠═60eb8f14-3c9b-11eb-1bc4-b92eddd8d877
# ╠═b4f1df46-3c9b-11eb-1632-1b05ff6d4a15
# ╠═b7bf59b0-3c9b-11eb-355b-6b36463f5ae5
# ╠═061863dc-3c9b-11eb-0cf0-07ec1fbd7bab
# ╠═50c3adce-3c9b-11eb-3356-5d7ae9d09263
# ╠═bc0fb8de-3c9b-11eb-33c4-3d40170b837a
# ╠═a80a42dc-3c9b-11eb-24b1-c1bf60f73344
