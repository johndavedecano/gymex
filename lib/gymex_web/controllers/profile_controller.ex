defmodule GymexWeb.ProfileController do
  use GymexWeb, :controller

  alias Gymex.Account.User
  alias Gymex.Account.Profile
  alias Gymex.Repo

  def show(conn, %{"id" => id}) do
    try do
      profile = Repo.get!(Profile, id)
      render(conn, "profile.json", profile: profile)
    rescue
      e in Ecto.NoResultsError ->
      conn
      |> put_status(:internal_server_error)
      |> render(GymexWeb.ErrorView, "common.json", message: e.message)
    end
  end

  def update(conn, %{"id" => id, "profile" => profile_params}) do
    case Repo.get!(Profile, id)
    |> Profile.update(profile_params)
    |> Repo.update do
      {:ok, next_profile} -> render(conn, "profile.json", profile: next_profile)
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(GymexWeb.ErrorView, "error.json", changeset: changeset)
      {:error, message} ->
          conn
          |> put_status(:internal_server_error)
          |> render(GymexWeb.ErrorView, "common.json", message: message)
    end
  end

  def update(conn, %{"id" => id}) do
    try do
      profile = Repo.get!(Profile, id)
      render(conn, "profile.json", profile: profile)
    rescue
      e in Ecto.NoResultsError ->
      conn
      |> put_status(:internal_server_error)
      |> render(GymexWeb.ErrorView, "common.json", message: e.message)
    end
  end
end
