defmodule InvengerWeb.SupplyController do
  use InvengerWeb, :controller

  alias Invenger.Supply

  action_fallback InvengerWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- Invenger.create_supply(params) do
      conn
      |> put_status(:created)
      |> render("supply.json", supply: supply)
    end
  end

  def show(conn, %{"id" => id}) do
    with %Supply{} = supply <- Invenger.get_supply(id) do
      conn
      |> render("supply.json", supply: supply)
    end
  end
end
