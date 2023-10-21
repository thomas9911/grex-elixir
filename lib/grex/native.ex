defmodule Grex.Native do
  use Rustler, otp_app: :grex, crate: "grex_native"

  def new_from_list(_input), do: nif_error()
  def new_builder(_input), do: nif_error()
  def builder_build(_builder), do: nif_error()

  defp nif_error do
    :erlang.nif_error(:nif_not_loaded)
  end
end
