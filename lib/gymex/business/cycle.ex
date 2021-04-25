defmodule Gymex.Business.Cycle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cycles" do
    field :description, :string
    field :is_deleted, :boolean, default: false
    field :name, :string
    field :num_days, :integer

    timestamps()
  end

  @doc false
  def changeset(cycle, attrs) do
    cycle
    |> cast(attrs, [:name, :is_deleted, :num_days, :description])
    |> validate_required([:name, :is_deleted, :num_days, :description])
    |> unique_constraint(:name)
  end
end
