defmodule Gymex.Business.Service do
  use Ecto.Schema
  import Ecto.Changeset

  schema "services" do
    field :description, :string
    field :is_deleted, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:name, :description, :is_deleted])
    |> validate_required([:name, :description, :is_deleted])
    |> unique_constraint(:name)
  end
end
