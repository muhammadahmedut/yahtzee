defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee

  test "greets the world" do
    assert Yahtzee.hello() == :world
  end
  
  describe "score_lower/1 - Three of a kind" do
    test "Identify 'Three of a kind' with ones" do
      assert %{"Three of a kind": 17} = Yahtzee.score_lower([2, 3, 4, 4, 4])
    end

    test "Identify 'Three of a kind' with threes" do
      assert %{"Three of a kind": 13} = Yahtzee.score_lower([3, 3, 3, 2, 2])
    end

    test "Identify 'Three of a kind' with fives" do
      assert %{"Three of a kind": 25} = Yahtzee.score_lower([5, 5, 5, 5, 5])
    end

    test "No 'Three of a kind' present" do
      assert %{"Three of a kind": 0} = Yahtzee.score_lower([1, 2, 3, 4, 5])
    end

    test "Exactly three of a kind, not four or five" do
      assert %{"Three of a kind": 14} = Yahtzee.score_lower([2, 2, 2, 4, 4])
    end
  end
end
