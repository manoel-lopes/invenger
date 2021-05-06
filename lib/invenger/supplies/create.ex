defmodule Invenger.Supplies.Create do
  alias Invenger.{Repo, Supply}

  def call(params) do
    params
    |> Supply.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Supply{}} = supply), do: supply
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
