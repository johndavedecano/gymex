defmodule Gymex.Business.Package do
  use Ecto.Schema
  import Ecto.Changeset

  schema "packages" do
    field :amount, :decimal
    field :is_delete, :boolean, default: false
    field :name, :string

    belongs_to :service, Gymex.Business.Service
    belongs_to :cycle, Gymex.Business.Cycle

    timestamps()
  end

  @doc false
  def changeset(package, attrs) do
    package
    |> cast(attrs, [:amount, :name, :is_delete])
    |> validate_required([:amount, :name, :is_delete])
    |> unique_constraint(:name)
  end
end
