File.rm("D:\\ups2.csv")

"D:\\ups.csv"
|> File.stream!
|> Enum.map(&String.replace(&1, "\n", ""))
|> Enum.reduce([], fn(el, acc) ->
    [
        _,
        _,
        weight_lb,
        ca,
        _,
        gb,
        de,
        fr,
        jp,
        it,
        es,
        au,
        br,
        sg,
        at,
        gr,
        _,
        hr,
        rest
    ] = String.split(el, ";")

    acc ++ [
        %{
            weight: weight_lb,
            countries: "CA",
            rate: ca
        },
        %{
            weight: weight_lb,
            countries: "GB",
            rate: gb
        },
        %{
            weight: weight_lb,
            countries: "DE",
            rate: de
        },
        %{
            weight: weight_lb,
            countries: "FR",
            rate: fr
        },
        %{
            weight: weight_lb,
            countries: "JP",
            rate: jp
        },
        %{
            weight: weight_lb,
            countries: "IT",
            rate: it
        },
        %{
            weight: weight_lb,
            countries: "ES",
            rate: es
        },
        %{
            weight: weight_lb,
            countries: "AU/NZ",
            rate: au
        },
        %{
            weight: weight_lb,
            countries: "BR",
            rate: br
        },
        %{
            weight: weight_lb,
            countries: "SG/HK/KR",
            rate: sg
        },
        %{
            weight: weight_lb,
            countries: "AT/BE/DK/FI/NL/NO/PL/SE/CH",
            rate: at
        },
        %{
            weight: weight_lb,
            countries: "GR/IE/IL/PT",
            rate: gr
        },
        %{
            weight: weight_lb,
            countries: "HR/ET/GI/HU/LU/LV/LT/LX/MY/MT/RU",
            rate: hr
        },
        %{
            weight: weight_lb,
            countries: "rest of world",
            rate: rest
        }
    ]
end)
|> Enum.map(fn %{
            weight: w,
            countries: c,
            rate: r
        } -> 
    {weight, _} = Float.parse(w)
    {rate, _} = Float.parse(r)
    %{
        weight: weight,
        countries: c,
        rate: rate
    }
end)
|> Enum.map(fn %{
            weight: w,
            countries: c,
            rate: r
        } ->
    "#{w};#{c};#{r}" 
end)
|> Enum.map(fn l -> File.write("D:\\ups2.csv", "#{l}\n", [:append]) end)
