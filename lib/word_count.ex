defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    words = String.replace(sentence, ~r/@|#|\$|%|&|\^|:|_|!|,/u, " ")
    |> String.split()

    Enum.reduce words, %{}, fn word, counts ->
      word = String.downcase word
      Map.update counts, word, 1,&(&1 + 1) end
  end
end
