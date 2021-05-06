defmodule InvengerWeb.RestaurantController do
  use InvengerWeb, :controller

  alias Invenger.Restaurant

  action_fallback InvengerWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Invenger.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("restaurant.json", restaurant: restaurant)
    end
  end
end
