module Aoc

using Test: @testset

export @ex, @day, all_examples, all_days

include("utils.jl")
include("Day01.jl")

"""
    @ex day

Run the programme on the example input for a given day.
"""
macro ex(day)
    :(getfield(getfield(Aoc, Symbol("Day" * lpad($(esc(day)), 2, '0'))), :example)())
end

"""
    @day day

Run the programme on the true input for a given day.
"""
macro day(day)
    :(getfield(getfield(Aoc, Symbol("Day" * lpad($(esc(day)), 2, '0'))), :day)())
end

"""
    all_examples()

Run a testset containing all the examples.
"""
function all_examples()
    @testset "AoC 2023 examples" verbose = true for day in 1:25
        @testset "Day $(lpad(day, 2, '0'))" begin
            @ex day
        end
    end
end

"""
    all_days()

Run a testset containing all the days.
"""
function all_days()
    @testset "AoC 2023 real inputs" verbose = true for day in 1:25
        @testset "Day $(lpad(day, 2, '0'))" begin
            (part1, part2) = @day day
            @info "Day $day, Part 1: $part1"
            @info "Day $day, Part 2: $part2"
        end
    end
end

end # module Aoc
