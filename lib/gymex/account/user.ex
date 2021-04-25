defmodule Gymex.Account.User do
  use Ecto.Schema

  import Ecto.Changeset

  import Bcrypt, only: [add_hash: 1]

  schema "users" do
    field :active, :boolean, default: false
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :role, :string
    field :username, :string
    field :verified, :boolean, default: false
    has_one :profile, Gymex.Account.Profile, on_delete: :delete_all
    timestamps()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, add_hash(password))
  end

  def create(user, attrs) do
    user
    |> cast(attrs, [
      :first_name,
      :last_name,
      :email,
      :username,
      :password,
      :role,
      :active,
      :verified
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :email,
      :username,
      :password,
      :role,
      :active,
      :verified
    ])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> put_pass_hash
  end

  def update(user, attrs) do
    user
    |> cast(attrs, [
      :first_name,
      :last_name,
      :email,
      :username,
      :password,
      :role,
      :active,
      :verified
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :email,
      :username,
      :password,
      :role,
      :active,
      :verified
    ])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> put_pass_hash
  end
end
