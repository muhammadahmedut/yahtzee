defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee

  test "greets the world" do
    assert Yahtzee.hello() == :world
  end

  describe "score_lower/1 - Four of a kind" do
    test "Identify 'Four of a kind' with every face" do
      assert %{"Four of a kind": 24} = Yahtzee.score_lower([5, 5, 5, 5, 4])
    end

    test "Identify 'Four of a kind' with all the same face" do
      assert %{"Four of a kind": 20} = Yahtzee.score_lower([5, 5, 5, 5, 5])
    end

    test "Identify 'Four of a kind' with four sixes" do
      assert %{"Four of a kind": 26} = Yahtzee.score_lower([6, 6, 6, 6, 2])
    end

    test "No 'Four of a kind' present" do
      assert %{"Four of a kind": 0} = Yahtzee.score_lower([1, 2, 3, 4, 5])
    end

    test "Exactly four of a kind, not five" do
      assert %{"Four of a kind": 18} = Yahtzee.score_lower([4, 4, 4, 4, 2])
    end
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
