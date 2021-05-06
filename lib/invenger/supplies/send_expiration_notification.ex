defmodule Invenger.Supplies.SendExpirationNotification do
  alias Invenger.Mailer

  def call() do
    Invenger.get_supply_by_expiration()
    |> Task.async_stream(fn {to_email, supplies} ->
      send_email(to_email, supplies)
    end)
    |> Stream.run()
  end

  defp send_email(to_email, supplies) do
    to_email
    |> Invenger.create_expiration_email(supplies)
    |> Mailer.deliver_later!()
  end
end
