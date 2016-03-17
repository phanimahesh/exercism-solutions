defmodule Bob do
  def hey(input) do
    cond do
      silent?(input)   -> "Fine. Be that way!"
      question?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      # Everything else
      true             -> "Whatever."
    end
  end

  def silent?(input) do
    String.strip(input) == ""    
  end

  def question?(input) do
    input
    |> String.ends_with? "?" 
  end

  def shouting?(input) do
    # Atleast one letter from alphabet, all characters in caps.
    String.upcase(input) == input and String.downcase(input) != input
  end
end
