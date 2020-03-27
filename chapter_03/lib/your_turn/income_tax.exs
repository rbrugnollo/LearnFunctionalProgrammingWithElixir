ic = fn
    s when s <= 2000 -> 0
    s when s <= 3000 -> s * 0.05
    s when s <= 6000 -> s * 0.10
    s -> s * 0.15
end

user_input = IO.gets "Type your salary: \n"

result = case Integer.parse(user_input) do
    :error -> "Invalid Wage"
    {s, _} -> 
        tax = ic.(s)
        "Tax: #{tax}, Net wage: #{s - tax}"
end

IO.puts result
