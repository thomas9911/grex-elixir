defmodule Grex do
  @moduledoc """
  Documentation for `Grex`.
  """

  def regex([]) do
    {:error, :empty_list}
  end

  def regex(list) when list != [] do
    regex_string = Grex.Native.new_from_list(list)
    Regex.compile(regex_string)
  end

  def regex!(list) when list != [] do
    regex_string = Grex.Native.new_from_list(list)
    Regex.compile!(regex_string)
  end

  def builder(list) when list != [] do
    Grex.Native.new_builder(list)
  end
end
