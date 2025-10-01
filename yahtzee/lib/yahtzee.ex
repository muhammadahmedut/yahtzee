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

    full_house_score =
      if is_full_house?(dice) do
        25
      else
        0
      end

    large_straight_score =
      if is_large_straight?(dice) do
        40
      else
        0
      end

    small_straight_score =
      if large_straight_score == 0 and is_small_straight?(dice) do
        30
      else
        0
      end

    yahtzee_score =
      if is_yahtzee?(dice) do
        50
      else
        0
      end

    %{
      "Three of a kind" => three_score,
      "Four of a kind" => four_score,
      "Full house" => full_house_score,
      "Large straight" => large_straight_score,
      "Small straight" => small_straight_score,
      "Yahtzee" => yahtzee_score
    }
  end

  defp is_yahtzee?(dice) do
    [h | t] = dice
    Enum.all?(t, fn x -> x == h end)
  end

  defp is_small_straight?(dice) do
    uniq = dice |> Enum.uniq() |> Enum.sort()
    small_straights = [
      [1,2,3,4], [2,3,4,5], [3,4,5,6]
    ]
    Enum.any?(small_straights, fn seq -> seq -- uniq == [] end)
  end

  defp is_large_straight?(dice) do
    sorted = dice |> Enum.uniq() |> Enum.sort()
    sorted == [1, 2, 3, 4, 5] or sorted == [2, 3, 4, 5, 6]
  end

  defp is_full_house?(dice) do
    counts = dice |> Enum.frequencies() |> Map.values() |> Enum.sort()
    counts == [2, 3]
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
