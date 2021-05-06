defmodule Invenger do
  alias Invenger.Restaurants.Create, as: CreateRestaurant
  alias Invenger.Supplies.Create, as: CreateSupply
  alias Invenger.Supplies.Show, as: ShowSupply
  alias Invenger.Supplies.GetByExpiration, as: GetByExpiration
  alias Invenger.Supplies.CreateExpirationEmail, as: CreateExpirationEmail
  alias Invenger.Supplies.SendExpirationNotification, as: SendExpirationNotification

  defdelegate create_restaurant(params), to: CreateRestaurant, as: :call
  defdelegate create_supply(params), to: CreateSupply, as: :call
  defdelegate get_supply(params), to: ShowSupply, as: :call
  defdelegate get_supply_by_expiration(), to: GetByExpiration, as: :call
  defdelegate create_expiration_email(to_email, supplies), to: CreateExpirationEmail, as: :call
  defdelegate send_expiration_notification(), to: SendExpirationNotification, as: :call
end
