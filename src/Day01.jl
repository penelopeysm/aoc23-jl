module Day01

using Test: @test
using ..Utils

macro split(next, in)
    next_args = :(split($(esc(in)), '\n'))
    push!(next.args, next_args)
    next
end

macro to_2_digits(next, in)
    next_arg = :(map($_to_2_digits, $(esc(in))))
    push!(next.args, next_arg)
    next
end

function _to_2_digits(line::AbstractString)
    first, last = 0, 0
    for c in line
        if isdigit(c)
            first = parse(Int, c)
            break
        end
    end
    for c in reverse(line)
        if isdigit(c)
            last = parse(Int, c)
            break
        end
    end
    return 10 * first + last
end

macro to_2_digits_p2(next, in)
    next_arg = :(map($_to_2_digits_p2, $(esc(in))))
    push!(next.args, next_arg)
    next
end

function find_digit_prefix(str::AbstractString)
    isdigit(str[1]) && return parse(Int, str[1])
    startswith(str, "one") && return 1
    startswith(str, "two") && return 2
    startswith(str, "three") && return 3
    startswith(str, "four") && return 4
    startswith(str, "five") && return 5
    startswith(str, "six") && return 6
    startswith(str, "seven") && return 7
    startswith(str, "eight") && return 8
    startswith(str, "nine") && return 9
    return nothing
end

function _to_2_digits_p2(line::AbstractString)
    first, last = nothing, nothing
    idxs = collect(eachindex(line))
    for i in idxs
        first = find_digit_prefix(line[i:end])
        first !== nothing && break
    end
    for i in reverse(idxs)
        last = find_digit_prefix(line[i:end])
        last !== nothing && break
    end
    first === nothing && last === nothing && error("No digits found in line: $line")
    return 10 * first + last
end

macro sum(next, in)
    next_arg = :($sum($(esc(in))))
    push!(next.args, next_arg)
    next
end

macro id(in)
    :($(esc(in)))
end

macro part1(input)
    :(@split (@to_2_digits @sum @id) $(esc(input)))
end

macro part2(input)
    :(@split (@to_2_digits_p2 @sum @id) $(esc(input)))
end

function ex()
    @test @part1(get_example(1, 1)) == 142
    @test @part2(get_example(1, 2)) == 281
end

function day()
    true_input = get_input(1)
    (@part1(true_input), @part2(true_input))
end

end
