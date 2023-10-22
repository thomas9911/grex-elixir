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

    test "some flags" do
      assert {:ok, ~r/(?i)[ab]/ = regex} =
               ["a", "b"]
               |> Grex.builder()
               |> Grex.Builder.with_capturing_groups()
               |> Grex.Builder.with_case_insensitive_matching()
               |> Grex.Builder.with_escaping_of_non_ascii_chars(true)
               |> Grex.Builder.with_minimum_repetitions(2)
               |> Grex.Builder.with_minimum_substring_length(2)
               |> Grex.Builder.without_anchors()
               |> Grex.Builder.build_and_compile()

      assert Regex.match?(regex, "a")
      assert Regex.match?(regex, "b")
      refute Regex.match?(regex, "c")
    end

    test "all flags" do
      assert ~r/(?ix)\n  \w/ =
               regex =
               ["a", "b"]
               |> Grex.builder()
               |> Grex.Builder.with_capturing_groups()
               |> Grex.Builder.with_case_insensitive_matching()
               |> Grex.Builder.with_conversion_of_digits()
               |> Grex.Builder.with_conversion_of_non_digits()
               |> Grex.Builder.with_conversion_of_non_whitespace()
               |> Grex.Builder.with_conversion_of_non_words()
               |> Grex.Builder.with_conversion_of_repetitions()
               |> Grex.Builder.with_conversion_of_whitespace()
               |> Grex.Builder.with_conversion_of_words()
               |> Grex.Builder.with_escaping_of_non_ascii_chars(true)
               |> Grex.Builder.with_minimum_repetitions(2)
               |> Grex.Builder.with_minimum_substring_length(2)
               |> Grex.Builder.with_verbose_mode()
               |> Grex.Builder.without_anchors()
               |> Grex.Builder.without_end_anchor()
               |> Grex.Builder.without_start_anchor()
               |> Grex.Builder.build_and_compile!()

      assert Regex.match?(regex, "a")
      assert Regex.match?(regex, "b")
      assert Regex.match?(regex, "c")
      assert Regex.match?(regex, "ab")
      assert Regex.match?(regex, "abc")
      refute Regex.match?(regex, "@@")
    end

    test "emails" do
      assert {:ok, ~r/^test\d{1,3}@example\.com$/} =
               [
                 "test1@example.com",
                 "test2@example.com",
                 "test3@example.com",
                 "test4@example.com",
                 "test5@example.com",
                 "test6@example.com",
                 "test11@example.com",
                 "test111@example.com",
                 "test115@example.com"
               ]
               |> Grex.builder()
               |> Grex.Builder.with_conversion_of_digits()
               |> Grex.Builder.with_conversion_of_repetitions()
               |> Grex.Builder.build_and_compile()
    end
  end
end
