defmodule Gymex.Account.AccountService do
  alias Gymex.Repo
  alias Gymex.Account.User
  alias Gymex.Account.Profile
  # alias Ecto.Multi
  alias Ecto.Changeset

  def create_user(params) do
    User.create(%User{profile: %Profile{}}, params) |> Repo.insert
  end
end
