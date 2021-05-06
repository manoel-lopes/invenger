defmodule InvengerWeb.SupplyView do
  alias Invenger.{Supply}

  def render("supply.json", %{
        supply: %Supply{
          id: id,
          description: description,
          expiration_date: expiration_date,
          responsible: responsible
        }
      }) do
    %{
      id: id,
      description: description,
      expiration_date: expiration_date,
      responsible: responsible
    }
  end
end
