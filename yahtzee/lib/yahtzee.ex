defmodule Yahtzee do
  @moduledoc """
  Documentation for `Yahtzee`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Yahtzee.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Scores the lower section for 'Three of a kind'.
  Returns a map with the key "Three of a kind" and the score as value.
  """

  def score_lower(dice) when is_list(dice) do
    three_score =
      if has_three_of_a_kind?(dice) do
        Enum.sum(dice)
      else
        0
      end

    four_score =
      if has_four_of_a_kind?(dice) do
        Enum.sum(dice)
      else
        0
      end

  %{"Three of a kind" => three_score, "Four of a kind" => four_score}
  end

  defp has_four_of_a_kind?(dice) do
    dice
    |> Enum.frequencies()
    |> Enum.any?(fn {_face, count} -> count >= 4 end)
  end

  defp has_three_of_a_kind?(dice) do
    dice
    |> Enum.frequencies()
    |> Enum.any?(fn {_face, count} -> count >= 3 end)
  end
end
