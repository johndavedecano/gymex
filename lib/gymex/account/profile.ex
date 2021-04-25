defmodule Gymex.Account.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :address, :string
    field :avatar, :string
    field :bio, :string
    field :city, :string
    field :country, :string
    field :dob, :date
    field :mobile_number, :string
    field :state, :string
    field :zipcode, :string
    belongs_to :user, Gymex.Account.User
    timestamps()
  end

  @doc false
  def update(profiles, attrs) do
    profiles
    |> cast(attrs, [:dob, :avatar, :address, :city, :state, :zipcode, :country, :bio, :mobile_number])
  end
end
