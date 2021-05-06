defmodule Invenger.Supplies.CreateExpirationEmail do
  import Bamboo.Email

  alias Invenger.Supply

  def call(to_email, supplies) do
    new_email(
      to: to_email,
      from: "api@invenger.com",
      subject: "Supplies that are about to expire",
      text_body: create_supply_email(supplies)
    )
  end

  defp create_supply_email(supplies) do
    initial_text = "-------------Supplies that are about to expire---------\n"

    Enum.reduce(supplies, initial_text, fn supply, text ->
      text <> parse_supply_to_string(supply)
    end)
  end

  defp parse_supply_to_string(%Supply{
    description: description,
    expiration_date: expiration_date,
    responsible: responsible
  }) do

    "Description: #{description}, Expiration_date #{expiration_date}, Responsible: #{responsible}\n"
  end
end
