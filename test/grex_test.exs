defmodule GrexTest do
  use ExUnit.Case, async: true
  doctest Grex

  test "regex!" do
    assert ~r"^[ab]$" == Grex.regex!(["a", "b"])
  end

  test "regex" do
    assert {:ok, ~r"^[ab]$"} == Grex.regex(["a", "b"])
  end

  describe "builder" do
    test "simple" do
      assert "^[ab]$" == ["a", "b"] |> Grex.builder() |> Grex.Builder.build()
    end
  end
end
