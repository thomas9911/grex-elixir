defmodule Grex.CompiletimeTest.Helper do
  @regex Grex.regex!(["a", "A"])

  def regex do
    @regex
  end
end

defmodule Grex.CompiletimeTest do
  use ExUnit.Case, async: true

  test "module attribute works" do
    regex = Grex.CompiletimeTest.Helper.regex()
    assert ~r/^[Aa]$/ == regex
    assert Regex.match?(regex, "A")
    assert Regex.match?(regex, "a")
    refute Regex.match?(regex, "b")
  end
end
