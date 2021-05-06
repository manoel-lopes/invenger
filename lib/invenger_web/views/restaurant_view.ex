defmodule InvengerWeb.RestaurantView do
  alias Invenger.{Restaurant}

  def render("restaurant.json", %{
        restaurant: %Restaurant{
          id: id,
          name: name,
          email: email
        }
      }) do
    %{
      id: id,
      name: name,
      email: email
    }
  end
end
