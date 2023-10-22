defmodule Grex.Builder do
  defstruct [:inner]

  def build(builder) do
    Grex.Native.builder_build(builder)
  end

  def build_and_compile(builder) do
    builder
    |> build()
    |> Regex.compile()
  end

  def build_and_compile!(builder) do
    builder
    |> build()
    |> Regex.compile!()
  end

  def with_capturing_groups(builder) do
    Grex.Native.builder_with_capturing_groups(builder)
  end

  def with_case_insensitive_matching(builder) do
    Grex.Native.builder_with_case_insensitive_matching(builder)
  end

  def with_conversion_of_digits(builder) do
    Grex.Native.builder_with_conversion_of_digits(builder)
  end

  def with_conversion_of_non_digits(builder) do
    Grex.Native.builder_with_conversion_of_non_digits(builder)
  end

  def with_conversion_of_non_whitespace(builder) do
    Grex.Native.builder_with_conversion_of_non_whitespace(builder)
  end

  def with_conversion_of_non_words(builder) do
    Grex.Native.builder_with_conversion_of_non_words(builder)
  end

  def with_conversion_of_repetitions(builder) do
    Grex.Native.builder_with_conversion_of_repetitions(builder)
  end

  def with_conversion_of_whitespace(builder) do
    Grex.Native.builder_with_conversion_of_whitespace(builder)
  end

  def with_conversion_of_words(builder) do
    Grex.Native.builder_with_conversion_of_words(builder)
  end

  def with_escaping_of_non_ascii_chars(builder, use_surrogate_pairs) do
    Grex.Native.builder_with_escaping_of_non_ascii_chars(builder, use_surrogate_pairs)
  end

  def with_minimum_repetitions(builder, quantity) do
    Grex.Native.builder_with_minimum_repetitions(builder, quantity)
  end

  def with_minimum_substring_length(builder, length) do
    Grex.Native.builder_with_minimum_substring_length(builder, length)
  end

  def with_verbose_mode(builder) do
    Grex.Native.builder_with_verbose_mode(builder)
  end

  def without_anchors(builder) do
    Grex.Native.builder_without_anchors(builder)
  end

  def without_end_anchor(builder) do
    Grex.Native.builder_without_end_anchor(builder)
  end

  def without_start_anchor(builder) do
    Grex.Native.builder_without_start_anchor(builder)
  end
end
