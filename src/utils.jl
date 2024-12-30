module Utils

export get_input, get_example

function get_input(day_number::Int)
    day_number = lpad(day_number, 2, '0')
    filename = "inputs/$(day_number).txt"
    open(filename) do file
        return read(file, String)
    end
end

function get_example(day_number::Int)
    day_number = lpad(day_number, 2, '0')
    filename = "inputs/ex$(day_number).txt"
    open(filename) do file
        return read(file, String)
    end
end

function get_example(day_number::Int, part::Int)
    day_number = lpad(day_number, 2, '0')
    filename = "inputs/ex$(day_number)_$(part).txt"
    open(filename) do file
        return read(file, String)
    end
end

end
