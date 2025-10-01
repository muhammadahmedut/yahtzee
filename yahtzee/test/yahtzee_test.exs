  test "Identify any other combination (Chance)" do
    result = Yahtzee.score_lower([1, 1, 2, 2, 4])
    assert result["Chance"] == 10
  end

  test "Chance with all different faces" do
    result = Yahtzee.score_lower([1, 2, 3, 4, 5])
    assert result["Chance"] == 15
  end

  test "Chance with some matching faces but not a category" do
    result = Yahtzee.score_lower([1, 1, 3, 4, 6])
    assert result["Chance"] == 15
  end
defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee

  test "Identify 'Yahtzee'" do
    result = Yahtzee.score_lower([2, 2, 2, 2, 2])
    assert result["Yahtzee"] == 50
  end

  test "No 'Yahtzee' present (different faces)" do
    result = Yahtzee.score_lower([2, 2, 2, 2, 3])
    assert result["Yahtzee"] == 0
  end

  test "No 'Yahtzee' present (all different)" do
    result = Yahtzee.score_lower([1, 2, 3, 4, 5])
    assert result["Yahtzee"] == 0
  end

  test "Identify 'Small straight'" do
    result1 = Yahtzee.score_lower([2, 3, 2, 5, 4])
    assert result1["Small straight"] == 30
    result2 = Yahtzee.score_lower([2, 3, 3, 4, 5])
    assert result2["Small straight"] == 30
  end

  test "No 'Small straight' present (no sequence)" do
    result = Yahtzee.score_lower([1, 2, 2, 5, 6])
    assert result["Small straight"] == 0
  end

  test "No 'Small straight' present (large straight present)" do
    result = Yahtzee.score_lower([2, 3, 4, 5, 6])
    assert result["Small straight"] == 0
  end

  test "Identify 'Large straight'" do
    result = Yahtzee.score_lower([2, 3, 4, 5, 6])
    assert result["Large straight"] == 40
  end

  test "Identify 'Large straight' with 1-5" do
    result = Yahtzee.score_lower([1, 2, 3, 4, 5])
    assert result["Large straight"] == 40
  end

  test "No 'Large straight' present (gap in sequence)" do
    result = Yahtzee.score_lower([1, 2, 3, 4, 6])
    assert result["Large straight"] == 0
  end

  test "No 'Large straight' present (duplicates)" do
    result = Yahtzee.score_lower([2, 3, 4, 4, 5])
    assert result["Large straight"] == 0
  end


  test "greets the world" do
    assert Yahtzee.hello() == :world
  end

  test "Identify 'Full house' with every face" do
    result = Yahtzee.score_lower([2, 2, 5, 5, 5])
    assert result["Full house"] == 25
  end

  test "Identify 'Full house' with low faces" do
    result = Yahtzee.score_lower([1, 1, 1, 2, 2])
    assert result["Full house"] == 25
  end

  test "Identify 'Full house' with high faces" do
    result = Yahtzee.score_lower([6, 6, 6, 3, 3])
    assert result["Full house"] == 25
  end

  test "No 'Full house' present (four of a kind)" do
    result = Yahtzee.score_lower([4, 4, 4, 4, 2])
    assert result["Full house"] == 0
  end

  test "No 'Full house' present (all different)" do
    result = Yahtzee.score_lower([1, 2, 3, 4, 5])
    assert result["Full house"] == 0
  end

  test "No 'Full house' present (three and two, but not matching)" do
    result = Yahtzee.score_lower([2, 2, 2, 3, 4])
    assert result["Full house"] == 0
  end

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
