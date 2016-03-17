defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.replace(specialchars, " ") 
    |> String.split
    |> Stream.map(&String.downcase/1)
    |> Enum.reduce(%{}, &update_counts/2)
  end

  def update_counts(word, counts) do
    counts |> Map.update(word, 1, &(&1+1))
  end

  def specialchars do
    # Hyphen excluded on purpose.
    ~r"""
    [
      `~!@#$%^&\*\(\)_=\+
      {}\[\]|\\
      ;:'",<.>/?
    ]
    """x
  end
end
