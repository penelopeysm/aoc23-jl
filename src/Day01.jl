module Day01

using Test: @test
using ..Utils

macro part1(input)
    nothing
end

macro part2(input)
    nothing
end

function example()
    example = get_example(1)
    @test @part1(example) === nothing
    @test @part2(example) === nothing
end

function day()
    input = get_input(1)
    (@part1(input), @part2(input))
end

end
