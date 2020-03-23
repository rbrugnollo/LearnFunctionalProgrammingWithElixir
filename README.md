# Learn Functional Programming with Elixir

- [Learn Functional Programming with Elixir](#learn-functional-programming-with-elixir)
  * [Running Code](#running-code)
  * [Chapter 1 - Thinking Functionally](#chapter-1---thinking-functionally)
    + [Why Functional?](#why-functional-)
      - [The limitations of Imperative Languages](#the-limitations-of-imperative-languages)
      - [Moving to Functional Programming](#moving-to-functional-programming)
    + [Working with Immutable Data](#working-with-immutable-data)
    + [Building Programs with Functions](#building-programs-with-functions)
        * [Pure functions](#pure-functions)
        * [Impure functions](#impure-functions)
      - [Transforming Values](#transforming-values)
      - [Declaring Code](#declaring-code)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>

## Running Code

- Get Elixir version  
`$ elixir -v`

- Open Elixir's interactive shell  
`$ iex`  
*(Press Ctrl + C twice to exit)*

- Execute script file  
`$ elixir hello_world.exs`

- File Extensions  
**.ex** for compiled files  
**.exs** for script files

## Chapter 1 - Thinking Functionally
*The rules that govern typical everyday programming are changing. That doesn't happen often. When it does, something important is going on.*

### Why Functional?

We need to write code that takes advantage of concurrency and parallelism.

#### The limitations of Imperative Languages

Imperative Languages have shared mutating values, which can be dangerous for concorrency and easily introduce bugs.

Instead of libraries that offer mechanisms to help lock and sync the changes, functional programming offers a better alternative.

#### Moving to Functional Programming

In FP, **functions** are the basic building blocks, values are **immutable**, and the code is **declarative**.

### Working with Immutable Data

In FP, all values you create are *immutable*, no matter the operation we apply to it:


```elixir
list = [1, 2, 3, 4]
# => [1, 2, 3, 4]

List.delete_at(list, -1)
# => [4]

list ++ [1]
# => [1, 2, 3, 4, 1]

IO.inspect list
# => [1, 2, 3, 4]
```

### Building Programs with Functions

- Functions are the primary tools for building a program
- They are usually short and expressive
- We combine multiple little functions to create a larger program
- Values are passed explicitly between functions
- Functions can be arguments and results

##### Pure functions
- Values are immutable
- The result is affected only by the function's arguments
- No side effects beyond the value returned

```elixir
add2 = fn (n) -> n + 2 end

add2.(2)
# => 4
```

##### Impure functions
More complex, unpredictable results and with side effects *(Chapter 7)*


#### Transforming Values
Elixir's focus is on the data transformation flow, and the pipe ( |> ) operator can be used to combine multiples functions' calls and results, where the result of each expression will be passed as a value to the next function.

```elixir
title 
|> String.split
|> capitalize_all
|> join_with_whitespace
```

#### Declaring Code
- Generates less and simpler code
- Less code = fewer bugs
- *what's necessary to solve a problem* instead of *how to solve a problem*( imperative)

## Chapter 2 - Working with Variables and Functions
- Values are anything that can represent data: Numbers, Strings, Fuctions, Maps and etc..
- Operators compute values and generate a result: +, *, -...
- *Literals* represent values that humans can easily understand.
- Elixir generates result for any expression: 
```elixir
iex> a = 2
2
```
- It's not possible to add text and a number:
```elixir
iex> "2" + 2
(ArithmeticError) ...
```

### Common Types:

|Type|Useful for|Examples|
|---------|---------|---------|
|string|Text|"Hello, World"|
|integer|Numbers|10 20 -2|
|float|Real numbers|10.8 -1.45|
|boolean|Logical operators|true, false|
|atom|Identifiers|:ok, :error, :exit|
|tuple|Building collections of known sizes|{:ok, "Hello"} {1,2,3}|
|list|Building collections of unknown sizes|[1,2] ["a", "b"]|
|map|Looking up a value in a dictionary by key|%{id: 123, name: "Anna"} %{12 => "User"}|
|nil|NULL|nil|

### Common Operators

|Operator|Useful for|Examples|
|---------|---------|---------|
|+|Adding numbers|1 + 2, 1.5 + 2|
|-|Substracting numbers|1-2, 1.5-2|
|/|Dividing numbers|10/2|
|\*|Multipling numbers|10\*2.5|
|==|Checking if equal|1 == 1.0|
|!=|Checking if not equal|"1"!=1|
|<|Less than|1<2|
|>|Greater than|2>1|
|++|Concatenating two lists|[1,2] ++ [3,4]|
|<>|Concatenating tow strings or binaries|"Hello, " <> "World!"|
|"#{}"|String interpolation|"Hello, #{name}!"|

### Creating Logical Expressions
- **and**, **or**, **not** are made to work with Boolean values, 
```elixir
iex> true and true
true

iex> true or false
true

iex> not true
false

iex> 1 and true
(BadBooleanError)

iex> true and 1
true
(right side part won't be computed)
```
- **&&**, **||**, **!** accept falsy(*nil and false*) or truthy(*anything else*) values and return a value based on the operator we use
```elixir
iex> nil && 1
nil

iex> true && "Hello, World!"
"Hello, World!"

iex> nil || 1
1

iex> !true
false
```

### Variables
- Explicit names
- snake_case format

```elixir
iex> quantity = 10
10

iex> product_price = 11.5
11.5

iex> total_cost = product_price * quantity
115.0
```

### Anonymous Functions
- Functions receive input, computes, and outputs the last expression
- Good practice to keep param number below 5
- Must be bound to a variable to be reused
- Also known as *lambdas*
- func = fn param_1, p_2 -> *body* end
- func.("param", 2)
- func_2 = fn -> *body* end
- func_2.()
- func_3 = &(&1 * &2)
- func_3.(10, 2)
- func_4 = & &1 * &2
- func_4.(10, 2)

 ```elixir
iex> hello = fn name -> "Hello, " <> name <> "!" end
iex> hello.("Ana")
"Hello, Ana!"
 ```
### Functions as First-Class Citizens
- Functions are values of type *function*
```elixir
iex> flat_fee = fn _ -> 5 end
iex> full_price = fn price, fee -> price + fee.(price) end
iex> full_price.(10, flat_fee)
15
 ```

### Sharing Values Without Using Arguments
- Use *closures*, as they have access to var values both inside and outside of the code block
- Closures "remember" all the free vars from when they were created 
- Scope is a part of a program (code block)
- Lexical scope is related to the visibility of the vars where they were defined
```elixir
iex> answer = 42
iex> make_answer = fn -> other_answer = 88 + answer end 
iex> make_answer.()
50
iex> other_answer
*** (Error)
iex> answer = 0
iex> make_answer.()
50
 ```

### Naming Functions
- *named functions* are defined inside *modules*
- *atom* or *aliases* can be used to name a function
- Alias is any word that starts with a capital letter ( String )
- During compile time, aliases become atoms (String == :"Elixir.String" )
- To call a function inside a module, use Module.function()
- It's possible to omit the parenthesis when calling a function ( `IO.puts "Hello"` )

### Elixir's Named Functions
- [Full Docs](https://hexdocs.pm/elixir/)
- Kernel module doesn't need the module name when called ``div(1,2)``
- All other modules do ``String.capitalize("HellO THerE")``

### Creating Modules and Functions
- use *snake_case.ex* for module file
- use *lib/namespace/module.ex* for module path 
- use *CamelCase*, *Namespace.Module* for module name
- only one module per file
- use *snake_case* from function name
- one line functions can be defined as `def func_name(), do: expression`
```elixir
defmodule Ecommerce.Checkout do
    def total_cost(price, tax_rate) do
        price * (tax_rate + 1)
    end
    def total_cost_single(price, tax_rate), do: price * tax_rate + 1
end
```
- to compile and use a file inside iex, use:
```elixir
iex> c("lib/ecommerce/checkout.ex")
iex> Ecommerce.Checkout.total_cost(100, 0.2)
120.0
```

### Importing Named Functions
- modules attributes can be defined with *@* and are used as annotations, temporary storage, or constants `@file_name "task_list.md"`
- use *import* directive to import modules' functions `import File, only: [write: 3, read: 1]`
- *import* directive should only be used when function names can't cause confusion

### Using Named Functions as Values
- use the *&function/arity* operator to bind a named function to a variable 

```elixir
iex> upcase = &String.upcase/1
iex> upcase.("oi")
OI
```
