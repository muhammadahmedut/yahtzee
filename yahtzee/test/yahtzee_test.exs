defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee

  test "greets the world" do
    assert Yahtzee.hello() == :world
  end

  describe "score_lower/1 - Four of a kind" do
    test "Identify 'Four of a kind' with every face" do
      result = Yahtzee.score_lower([5, 5, 5, 5, 4])
      assert result["Four of a kind"] == 24
    end

    test "Identify 'Four of a kind' with all the same face" do
      result = Yahtzee.score_lower([5, 5, 5, 5, 5])
      assert result["Four of a kind"] == 25
    end

    test "Identify 'Four of a kind' with four sixes" do
      result = Yahtzee.score_lower([6, 6, 6, 6, 2])
      assert result["Four of a kind"] == 26
    end

    test "No 'Four of a kind' present" do
      result = Yahtzee.score_lower([1, 2, 3, 4, 5])
      assert result["Four of a kind"] == 0
    end

    test "Exactly four of a kind, not five" do
      result = Yahtzee.score_lower([4, 4, 4, 4, 2])
      assert result["Four of a kind"] == 18
    end
  end
  
  describe "score_lower/1 - Three of a kind" do
    test "Identify 'Three of a kind' with ones" do
      result = Yahtzee.score_lower([2, 3, 4, 4, 4])
      assert result["Three of a kind"] == 17
    end

    test "Identify 'Three of a kind' with threes" do
      result = Yahtzee.score_lower([3, 3, 3, 2, 2])
      assert result["Three of a kind"] == 13
    end

    test "Identify 'Three of a kind' with fives" do
      result = Yahtzee.score_lower([5, 5, 5, 5, 5])
      assert result["Three of a kind"] == 25
    end

    test "No 'Three of a kind' present" do
      result = Yahtzee.score_lower([1, 2, 3, 4, 5])
      assert result["Three of a kind"] == 0
    end

    test "Exactly three of a kind, not four or five" do
      result = Yahtzee.score_lower([2, 2, 2, 4, 4])
      assert result["Three of a kind"] == 14
    end
  end
end
