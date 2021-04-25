defmodule Gymex.Business.Log do
  use Ecto.Schema
  import Ecto.Changeset

  schema "logs" do
    field :description, :string
    field :type, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:type, :description])
    |> validate_required([:type, :description])
  end
end
