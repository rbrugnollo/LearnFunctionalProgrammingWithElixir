total_spent = fn (%{
        strength: s_value, 
        dextexirity: d_value,
        intelligence: i_value,
    }) ->
    (s_value * 2) + (d_value * 3) + (i_value * 3)
end

%{
    strength: 2,
    dextexirity: 2,
    intelligence: 2,
}
|> total_spent.()
|> IO.inspect()
