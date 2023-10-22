defmodule Grex.Native do
  use Rustler, otp_app: :grex, crate: "grex_native"

  def new_from_list(_input), do: nif_error()

  def builder_new(_input), do: nif_error()
  def builder_build(_builder), do: nif_error()
  def builder_with_capturing_groups(_builder), do: nif_error()
  def builder_with_case_insensitive_matching(_builder), do: nif_error()
  def builder_with_conversion_of_digits(_builder), do: nif_error()
  def builder_with_conversion_of_non_digits(_builder), do: nif_error()
  def builder_with_conversion_of_non_whitespace(_builder), do: nif_error()
  def builder_with_conversion_of_non_words(_builder), do: nif_error()
  def builder_with_conversion_of_repetitions(_builder), do: nif_error()
  def builder_with_conversion_of_whitespace(_builder), do: nif_error()
  def builder_with_conversion_of_words(_builder), do: nif_error()
  def builder_with_escaping_of_non_ascii_chars(_builder, _use_surrogate_pairs), do: nif_error()
  def builder_with_minimum_repetitions(_builder, _quantity), do: nif_error()
  def builder_with_minimum_substring_length(_builder, _length), do: nif_error()
  def builder_with_verbose_mode(_builder), do: nif_error()
  def builder_without_anchors(_builder), do: nif_error()
  def builder_without_end_anchor(_builder), do: nif_error()
  def builder_without_start_anchor(_builder), do: nif_error()

  defp nif_error do
    :erlang.nif_error(:nif_not_loaded)
  end
end
