# aoc23-jl

This repo contains solutions for Advent of Code 2023 in Julia.

The twist is that _everything_ will be done with macros. (Well, _almost_ everything.)

This _is_:

- :heavy_check_mark: Primarily an educational exercise for me to get comfortable writing macros.

This is _not_:

- :x: A serious attempt to complete all 50 challenges.
- :x: A good way to write code. Almost every macro in here is completely needless.

## Usage

Clone the repository, then from its top-level directory, run:

```bash
julia --project=.
```

Then in the Julia REPL:

```julia
julia> using Aoc

julia> @ex 1   # To run against example input

julia> @day 1  # To run against real input
```

Note that real input is not committed to the repository, in line with AoC rules. 
Real input for day 1 should be placed in the `inputs/01.txt` file, and likewise for subsequent days.
