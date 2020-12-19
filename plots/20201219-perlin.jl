### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ b5c883c4-421e-11eb-01d5-279132f89203
using PenPlots, Random, PlutoUI, Colors, Base.Iterators

# ╔═╡ be833c48-421e-11eb-05c1-09da812c55c6
noise = random_vector_matrix(MersenneTwister(9), 6, 8)

# ╔═╡ c7e66c2e-421e-11eb-0a2e-29a57001cc86
map(0:0.01:1) do j
	r = 1 + perlin_noise(noise, Point(j*6, 0))
	center = 3 * frac_rotation(j) * unitvec * r

	Path(map(0:0.01:1) do i
		r = 1 + perlin_noise(noise, Point(i*6, j*8))
    	center + frac_rotation(i) * unitvec * r
  end)
end

# ╔═╡ Cell order:
# ╠═b5c883c4-421e-11eb-01d5-279132f89203
# ╠═be833c48-421e-11eb-05c1-09da812c55c6
# ╠═c7e66c2e-421e-11eb-0a2e-29a57001cc86
