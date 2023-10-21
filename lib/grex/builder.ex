defmodule Grex.Builder do
  defstruct [:inner]

  def build(builder) do
    Grex.Native.builder_build(builder)
  end
end
