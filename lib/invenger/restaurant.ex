defmodule Invenger.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  alias Invenger.Supply

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [
    :name,
    :email
  ]

  schema "restaurants" do
    field :name, :string
    field :email, :string

    has_many :supplies, Supply
    
    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_format(:email, ~r/[a-z0-9]+@[a-z0-9]+\.com/)
    |> unique_constraint([:email])
  end
end
