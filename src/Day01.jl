module Day01

using Test: @test
using ..Utils

macro part1(input)
    nothing
end

macro part2(input)
    nothing
end

function ex()
    example_input = get_example(1)
    @test @part1(example_input) === nothing
    @test @part2(example_input) === nothing
end

function day()
    true_input = get_input(1)
    (@part1(true_input), @part2(true_input))
end

end
