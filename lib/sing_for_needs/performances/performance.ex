defmodule SingForNeeds.Performances.Performance do
  @moduledoc """
      A Perfomance
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias SingForNeeds.Artists.Artist

  schema "performances" do
    field :name, :string
    field :detail, :string
    field :amount_raised, :decimal
    many_to_many(:artists, Artist, join_through: "artists_performances", on_replace: :delete)

    timestamps()
  end

  @doc """
  changeset to create performance
  """
  def changeset(performance, attrs) do
    performance
    |> cast(attrs, [:name, :detail, :amount_raised])
    |> validate_required([:name, :detail])
  end

  @doc """
    change set insert performance with artist (while creating the relationship)
  """
  def changeset_update_artists(performance, attrs) do
    performance
    |> cast(attrs, [:name, :detail, :amount_raised])
    |> put_assoc(:artists, attrs.artists)
  end
end
