defmodule GymexWeb.UserController do
  use GymexWeb, :controller

  alias Gymex.Account.User
  alias Gymex.Repo
  alias Gymex.Account.AccountService

  import Ecto.Query, only: [from: 2]

  def index(conn, params) do
    results = from(User, preload: [:profile]) |> Repo.paginate(params)
    render(conn, "index.json", results: results)
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(User, id) |> Repo.preload(:profile)
    render(conn, "user.json", user: user)
  end

  def create(conn, params) do
    case AccountService.create_user(params) do
      {:ok, user} -> render(conn, "user.json", user: user)
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

  def update(conn, %{"id" => id, "user" => user_params}) do
    transaction = Repo.get!(User, id) |> User.update(user_params) |> Repo.update
    case transaction do
      {:ok, next_user} -> render(conn, "user.json", user: next_user)
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

  def delete(conn, %{"id" => id}) do
    case Repo.get!(User, id) |> Repo.delete do
      {:ok, _} -> render(conn, "deleted.json")
      {:error, message} ->
          conn
          |> put_status(:internal_server_error)
          |> render(GymexWeb.ErrorView, "common.json", message: message)
    end
  end
end
