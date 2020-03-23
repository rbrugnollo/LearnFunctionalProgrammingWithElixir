apply_tax = fn price ->
    tax = price * 0.12
    IO.puts("Price: #{price + tax} - Tax: #{tax}")
end

Enum.each([12.5, 30.99, 250.49, 18.80], apply_tax)

