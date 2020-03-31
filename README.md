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
  * [Chapter 2 - Working with Variables and Functions](#chapter-2---working-with-variables-and-functions)
    + [Common Types:](#common-types-)
    + [Common Operators](#common-operators)
    + [Creating Logical Expressions](#creating-logical-expressions)
    + [Variables](#variables)
    + [Anonymous Functions](#anonymous-functions)
    + [Functions as First-Class Citizens](#functions-as-first-class-citizens)
    + [Sharing Values Without Using Arguments](#sharing-values-without-using-arguments)
    + [Naming Functions](#naming-functions)
    + [Elixir's Named Functions](#elixir-s-named-functions)
    + [Creating Modules and Functions](#creating-modules-and-functions)
    + [Importing Named Functions](#importing-named-functions)
    + [Using Named Functions as Values](#using-named-functions-as-values)
  * [Chapter 3 - Using Pattern Matching to Control the Program Flow](#chapter-3---using-pattern-matching-to-control-the-program-flow)
    + [Making Two things Match](#making-two-things-match)
    + [Unpacking Values from Various Data Types](#unpacking-values-from-various-data-types)
      - [Matching Parts of a String](#matching-parts-of-a-string)
      - [Matching Tuples](#matching-tuples)
      - [Matching Lists](#matching-lists)
      - [Matching Maps](#matching-maps)
      - [Maps vs. Keyword Lists](#maps-vs-keyword-lists)
      - [Matching Structs](#matching-structs)
        * [Sigils](#sigils)
    + [Control Flow with Functions](#control-flow-with-functions)
      - [Applying Default Values for Functions](#applying-default-values-for-functions)
      - [Expanding Control with Guard Clauses](#expanding-control-with-guard-clauses)
    + [Elixir Control-Flow Structures](#elixir-control-flow-structures)
      - [Case: Control with Pattern Matching](#case--control-with-pattern-matching)
      - [Cond: Control with Logical Expressions](#cond--control-with-logical-expressions)
      - [If: Taking a look at our old friend](#if--taking-a-look-at-our-old-friend)
  * [Chapter 4 - Diving into Recursion](#chapter-4---diving-into-recursion)
    + [Surrounded by Boundaries](#surrounded-by-boundaries)
      - [Navigating Through Lists](#navigating-through-lists)
      - [Transforming Lists](#transforming-lists)
        * [The Key-based Accessors](#the-key-based-accessors)
    + [Conquering Recursion](#conquering-recursion)
      - [Decrease and Conquer](#decrease-and-conquer)
      - [Divide and Conquer](#divide-and-conquer)
      - [Tail-Call Optimization](#tail-call-optimization)
    + [Functions without borders](#functions-without-borders)
      - [Making functions more predictable](#making-functions-more-predictable)
    + [Using Recursion with Anonymous Functions](#using-recursion-with-anonymous-functions)

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
- use *snake_case* for function name
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

## Chapter 3 - Using Pattern Matching to Control the Program Flow

Elixir's pattern match shapes everything you program.

### Making Two things Match

```elixir
iex> 1 = 1
1

iex> 2 = 1
** (MatchError)

iex> x = 1 (bind and match)
1
iex> 1 = x
1
iex> 2 = x
** (MatchError)
iex> x = 2 (rebind and match)
2
iex> ^x = 2 (pin operator avoids rebind and uses variable value)
2
iex> ^x = 1 (avoids rebind and uses variable value)
** (MatchError)
```
- You can use the _ wildcard to ignore parts of a Pattern Matching

### Unpacking Values from Various Data Types
Pattern matching is useful for extracting parts of values to variables in a process called *destructing*.

#### Matching Parts of a String

```elixir
iex> "Authentication: " <> credentials = "Authentication: Basic dxYz123"
"Authentication: Basic dxYz123"

iex> credentials
"Basic dxYz123"
```

- It's not possible to use a variable on the left side of the <> operator
```elixir
iex> first_name <> "Doe" = "John Doe"
** (CompileError)
```

#### Matching Tuples
Tuples are often used to pass a signal with values
- We can match and bind multiple items of a tuple
```elixir
iex> {a, b, c} = {4, 5, 6}
{4, 5, 6}

iex> b
5
```
- Tuples are useful for signaling successess and failures in a function's return
```elixir
iex> my_function = fn -> {:ok, 42} end
iex> {:ok, answer} = my_function.()
iex> answer
42
iex> {:error, reason} = my_function.()
** (MatchError)
```

#### Matching Lists
- In Elixir, lists are *linked lists*

```elixir
iex> [a, a, a] = [1, 1, 1]
[1, 1, 1]
iex> [a, a, a] = [1, 2, 1]
** (MatchError)
iex> [a, b, a] = [1, 2, 1]
[1, 2, 1]
iex> [a, b, 1] = [1, 2, 1]
[1, 2, 1]
iex> [_, b, _] = [1, 2, 1]
[1, 2, 1]
```
-Using the | operator to split arrays
```elixir
iex> [head | tail] = [1,2,3,4]
iex> head
1
iex> tail
[2,3,4]
```
```elixir
iex> [a, b | tail] = [1,2,3,4]
iex> a
1
iex> b
1
iex> tail
[3,4]
```
```elixir
iex> [head | tail] = [1]
iex> head
1
iex> tail
[]
```
```elixir
iex> [head | tail] = []
** MatchError
```

#### Matching Maps
Maps are data types structured in key/value pairs
```elixir
iex> user_signup = %{email: "johndoe@email.com", password: "1234"}
```
The key is a atom, if you need to use other values as key you should use =>
```elixir
iex> sales = %{"2017/01"=> 200, "2017/02"=> 250}
```
It's possible to create nested structures
```elixir
%{
  name: "John Doe",
  programming_languages: ["Ruby", "Python", "Java"],
  location: %{city: "New York", country:"US"}
}
```

- Pattern Match and bind to variable

```elixir
iex> abilities = %{strength: 16, intelligence: 10}

iex> %{strength: s_value} = abilities
iex> s_value
16

iex> %{wisdom: w_value} = abilities
** MatchError

iex> %{strength: 16, intelligence: i_value} = abilities
iex> i_value
10

iex> %{strength: s_value = 16} = abilities (check and bind)
iex> s_value
16

iex> strength_value = 16
iex> %{strength: ^strength_value} = abilities (use value of ^strength_value)
```
#### Maps vs. Keyword Lists
- Keyword List is a list of two-element tuples
- It allows duplicate dkeys
- Keys must be atoms

```elixir
iex> [b, c] = [a: 1, a: 12]
iex> b
{:a, 1}
```

```elixir
x = %{a: 1, a:12} # result in {a: 12}
x = [a: 1, a: 12] # OK
x = [{:a, 1}, {:a, 12}] # same from above
x = %{1=> :a, 2 => :b} # OK
x = [1 => :a, 2 => :b] # Syntax error
```

- The syntax is similar, but their limitations make them handy for different cases

#### Matching Structs
- Structs are extensions of mapping structures
- Useful for representing consistent structures
- Similar to a class with props
- Pattern Matching works like it does with Maps
- *~D* is a date sigil
- The name of the struct can be used to match only the struct

```elixir
iex> date = ~D[2018-01-01]
iex> %{year: year} = date
iex> year
2018

iex> date = ~D[2018-01-01]
iex> %Date{year: year} = date
iex> year
2018

iex> date = %{year: 2018}
iex> %Date{year: year} = date
** MatchError
```

##### Sigils
- Sigils are shortcuts to create values with a simplified text representation
```elixir
iex> ~D[2018-01-01]
~D[2018-01-01]

iex> ~w(chocoalte jelly mint)
["chocolate", "jelly", "mint"]
```

### Control Flow with Functions
- Pattern Matching and Functions are the fundamental tools we use to control the program flow *see number_compare.ex*
- Arguments from functions are pattern-matching expressions
- To define a private function inside a module, use defp

#### Applying Default Values for Functions
- Use \\\\ to apply a default value to a named function
- Elixir will create multiple functions automatically on compile time
- In Elixir, functions have fixed arity
- Arity is part of the function's unique name

```elixir
defmodule Checkout do
    # &total_cost/1 and &total_cost/2 are created
    def total_cost(price, quantity \\ 10), do: price * quantity
end

iex> Checkout.total_cost(12)
120
iex> Checkout.total_cost(12, 5)
60
```

#### Expanding Control with Guard Clauses
- They permit us to add Boolean expression in our functions
- Help create better function signatures
- Can be created by using the *when* keyword after params
- Possible to use guards on *named* and *annonymous* *functions*

```elixir
def greater(number, other_number) when number >= other_number, do: number
def greater(_, other_number), do: other_number

var_greater = fn
    number, other_number when number >= other_number -> number
    _, other_number -> other_number
end
```

- Macro functions can be easily created with the *defguard* directive
- When macro is used, we need to use the directive *require*


### Elixir Control-Flow Structures
- Function clauses are usually used to control the flow of the program
- Elixir built-in control-flow structures like *case, cond, if and unless* can also be used


#### Case: Control with Pattern Matching
- Useful when we want to check an expression with multiple pattern matching clauses
- Useful with functions that may have unexpected effect
- It's possible to use guards on the clauses
- When a clause is matched, it'll execute the code and return the last expression
- if no clause is matched, an error is raised
```elixir
case Boolean expression do
    {:ok, value} -> value
    :error -> IO.puts("Error")
end
```

#### Cond: Control with Logical Expressions
- Useful we want to check variables in logical expressions
- Structure similar to *case*
- When a condition is *truthy*, execute related code
- if no condition is *truthy*, raise error

```elixir
result = cond do
    age < 12 -> "kid"
    age <= 18 -> "Teen"
```

#### If: Taking a look at our old friend
- Useful when you want to execute a command based on a *truthy* expression
- *unless* can be used as *if not*
- else block is optional, if not given, return *nil*
```elixir
def greater_if(number, other_number) do
    if number >= other_number do
        number
    else
        other_number
    end
end

def greater_unless(number, other_number) do
    unless number < other_number do
        number
    else
        other_number
    end
end

result = if(number >= other_number, do: number, else: other_number)
```


## Chapter 4 - Diving into Recursion
- While we use for and while loops on imperative languages, we have recursion in FP

### Surrounded by Boundaries
- A *bounded* recursion have an end
- Most common type
- Number of iterations is directly associated with the arguments
- Good practice: Declare the *boundary clause* first
```elixir
defmodule Sum do
    def up_to(0), do: 0
    def up_to(n), do: n + up_to(n -1)
end

iex> Sum.up_to(3) #will call the function n+1 times
6
```

#### Navigating Through Lists
- Use syntax [head | tail] to navigate through lists using recursion
- Can iterate through any data structure

```elixir
defmodule Math do
    def sum([]), do: 0
    def sum([head | tail]), do: head + sum(tail)
end

iex> Math.sum([5,2,3])
10

iex> Math.sum([])
0
```

#### Transforming Lists
- Transforming lists requires repetitive steps
- [head | tail] is useful for destructuring and constructing new lists
- [|] to prepend is faster than ++
```elixir
iex> [:a | [:b, :c]]
[:a, :b, :c]

iex> [[:b, :c] | :a ]
[:b, :c, :a]

iex> [:a, :b, :c]
[:a, :b, :c]
```

##### The Key-based Accessors
```elixir
iex> item = %{a: 1, b: 2}
iex> item[:a]
1
iex> item.a
1
iex> item[:c]
nil
iex> item.c
** KeyError
```

### Conquering Recursion
#### Decrease and Conquer
- Reduce a problem to its simplest form and start solving it incrementally
- E.g: Factorial
```elixir
defmodule Factorial do
    def of(0), do: 1
    def of(n) when n > 0, do: n * of(n-1)
end
```

#### Divide and Conquer
- Separate the problem into two or more parts
- Process independly and combine in the end
- E.g: Sorting functions

```elixir
defmodule Sort do
    def asc([]), do: []
    def asc([a]), do: [a]
    def asc(list) do
        half_size = div(Enum.count(list), 2)
        {list_a, list_b} = Enum.split(list, half_size)
        merge(
            asc(list_a),
            asc(list_b)
        )
    end

    defp merge([], list_b), do: list_b
    defp merge(list_a, []), do: list_a
    defp merge([head_a | tail_a], list_b = [head_b | _]) when head_a <= head_b do
        [head_a, merge(tail_a, list_b)]
    end
    defp merge(list_a = [head_a | _], [head_b | tail_b]) when head_a > head_b do
        [head_b, merge(list_a, tail_b)]
    end
end
```

#### Tail-Call Optimization
- Compiler reduces functions in memory without allocating more memory
- Last expression of a function must be a function call
- Common approach is to replace the use of the function result with an extra argument
- Extra argument accumulates the results of each iteration
- *body-recursive* functions are simpler to read and maintain, so they should be used when a low number of recursion is expected
- *tail-recursive* functions should be used when a large number of iterations is expected

Compare:
```elixir
defmodule Factorial do
    def of(0), do: 1
    def of(n) when n > 0, do: n * of(n -1) # will create stack
end

defmodule TailCallFactorial do
    def of(n), do: fac_of(n, 1)
    defp fac_of(0, acc), do: acc
    defp fac_of(n, acc) when > 0, do: fac_of(n - 1, n * acc) # will use tail-recursive optmization
end
```

### Functions without borders
- *Unbounded* recursion is when we can't predict the number of repetition for a recursive function
- For example: web crawler, directory navigator

#### Making functions more predictable
- Adding Boundaries
- Avoiding Infinite Loops

### Using Recursion with Anonymous Functions
- Recursion with anonymous functions isn't straightforward and should avoided
- It's necessary to wrap the function in another function to avoid nonexistent error
```elixir
iex> fact_gen = fn me ->
    fn
        0 -> 1
        x when x > 0 -> x * me.(me).(x - 1) 
    end
end

iex> factorial = fact_gen.(fact_gen)
iex> factorial.(5)
```
## Chapter 5 - Using Higher-Order Functions
- Higher-Order functions are those that take functions as arguments and/or return them.
- Useful for hiding complexity and laborius functions
- Receive functions as arguments as your receive any other arg
```def each([], function), do: nil ```
- Use functions as you use function values
```function.()```
- It's possible to send annonymous functions
```masMyList.each([], fn item -> IO.puts item end)```
- Value functions ```MyList.each([], my_function)```
- Named functions ```MyList.each([], &String.capitalize/1)```
- Operators as named functions ```MyList.reduce([], 0, &+/2)```
- Operators as named functions ```Enum.sort([], &<=/2)```

### Using the Enum Module
- Works with maps, lists, tuples and any type that implements the  Enumerable protocol
- Enum.each
- Enum.map
- Enum.reduce
- Enum.filter
- Enum.count
- Enum.sort
- Enum.sum
- Enum.uniq
- Enum.sort
- Enum.join

### Using Comprehensions
- using *for*, enumerables can be easily iterated, mapped and filtered
```elixir
iex> for a <- ["dogs", "cats", "flowers"], do: String.upcase(a)
["DOGS", "CATS", "FLOWERS"]
```
- each item of the list will be assigned to *a* 
- it's possible to have more than one generator
```elixir
iex> for a <- ["Willy", "Anna"], b <- ["Math", "English"], do: {a, b}
[{"Willy", "Math"}, {"Willy", "English"}, {"Anna", "Math"}, {"Anna", "English"}]
```
- we can filter by using pattern matching
```elixir
iex> parseds = for i <- ["10", "hot dogs", "20"], do: Integer.parse(i)
[{10, ""}, :error, {20, ""}]
iex> for {n, _} <- parseds, do: n
[10, 20]
```
- we can also filter with an expression for truthy values
```elixir
iex> for n <- [1,2,3,4,5], n > 3, do: n
[4,5]
```
