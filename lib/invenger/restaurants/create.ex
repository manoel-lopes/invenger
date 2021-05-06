defmodule Invenger.Restaurants.Create do
  alias Invenger.{Repo, Restaurant}

  def call(params) do
    params
    |> Restaurant.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Restaurant{}} = restaurant), do: restaurant
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
