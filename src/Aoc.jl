module Aoc

using Test: @testset, @test_broken, @test

export @ex, @day

include("utils.jl")
include("Day01.jl")

"""
    @ex

Run a testset containing all the examples.
"""
macro ex()
    quote
        @testset "AoC 2023 examples" verbose = true begin
            @testset "Day $(lpad(day, 2, '0'))"  for day in 1:25
                @ex day
            end
        end
    end
end

"""
    @ex day

Run the programme on the example input for a given day.
"""
macro ex(day)
    @gensym module_name
    quote
        $module_name = Symbol("Day" * lpad($(esc(day)), 2, '0'))
        try
            getfield(getfield(Aoc, $module_name), :ex)()
        catch e
            @test_broken $module_name == :NotImplementedYet
        end
    end
end

"""
    @day

Run a testset containing all the days.
"""
macro day()
    quote
        @testset "AoC 2023 real inputs" verbose = true begin
            @testset "Day $(lpad(day, 2, '0'))" for day in 1:25
                @day day
            end
        end
    end
end

"""
    @day day

Run the programme on the true input for a given day.
"""
macro day(day)
    @gensym day_number module_name
    quote
        $day_number = $(esc(day))
        $module_name = Symbol("Day" * lpad($day_number, 2, '0'))
        try
            (part1, part2) = getfield(getfield(Aoc, $module_name), :day)()
            @info "Day " * string($day_number) * ", Part 1: $part1"
            @info "Day " * string($day_number) * ", Part 2: $part2"
        catch e
            @test_broken $module_name == :NotImplementedYet
            (nothing, nothing)
        end
    end
end

end # module Aoc
