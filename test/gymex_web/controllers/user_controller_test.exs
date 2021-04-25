defmodule GymexWeb.UserControllerTest do
  use GymexWeb.ConnCase

  alias Gymex.Account.AccountService

  @user_fixture %{
    first_name: "John Dave",
    last_name: "Decano",
    email: "johndavedecano@gmail.com",
    username: "johndavedecano",
    password: "password",
    role: "user",
    active: true,
    verified: true,
  }

  test "GET /api/users", %{conn: conn} do

    AccountService.create_user(@user_fixture)

    conn = get(conn, "/api/users")
    response = json_response(conn, 200)

    assert is_list(response["entries"]) == true
    assert is_map(response["meta"]) == true
  end


  test "GET /api/users/:id", %{conn: conn} do

    {:ok, curr} = AccountService.create_user(@user_fixture)

    conn = get(conn, "/api/users/#{curr.id}")
    user = json_response(conn, 200)

    assert is_map(user) == true
    assert user["id"] == curr.id
  end

  test "POST /api/users", %{conn: conn} do
    conn = post(conn, "/api/users", @user_fixture)
    user = json_response(conn, 200)

    assert user["email"] == @user_fixture.email
    assert user["username"] == @user_fixture.username
    assert user["role"] == @user_fixture.role
    assert user["active"] == @user_fixture.active
    assert user["verified"] == @user_fixture.verified
  end

  test "PUT /api/users/:id", %{conn: conn} do
    {:ok, curr} = AccountService.create_user(@user_fixture)

    conn = put(conn, "/api/users/#{curr.id}", %{user: @user_fixture})
    user = json_response(conn, 200)

    assert user["email"] == @user_fixture.email
    assert user["username"] == @user_fixture.username
    assert user["role"] == @user_fixture.role
    assert user["active"] == @user_fixture.active
    assert user["verified"] == @user_fixture.verified
  end

  test "DELETE /api/users/:id", %{conn: conn} do
    {:ok, curr} = AccountService.create_user(@user_fixture)
    conn = delete(conn, "/api/users/#{curr.id}")
    json_response(conn, 200)
  end
end
