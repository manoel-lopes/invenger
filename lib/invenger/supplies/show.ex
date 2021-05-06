defmodule Invenger.Supplies.Show do
  alias Invenger.{Repo, Supply}

  def call(params) do
    id = params

    Supply
    |> Repo.get(id)
    |> handle_get()
  end

  defp handle_get(%Supply{} = supply), do: supply
  defp handle_get(nil), do: {:error, %{result: "Supply not found", status: :not_found}}
end
