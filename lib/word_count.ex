defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence

    |> String.split(~r{(\\n|[^\w'])+})
    |> Enum.filter(fn removeWhiteSpaces -> removeWhiteSpaces != "" end)

    |> Enum.reduce(%{}, fn word, countWord -> countWord
    |> Map.put_new(word, 0)
    |> Map.update(word, 1, &(&1+1)) end)
  end
end
