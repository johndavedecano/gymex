defmodule GymexWeb.ProfileControllerTest do
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
    verified: true
  }

  test "GET /api/profiles/:id", %{conn: conn} do
    {:ok, %{profile: profile}} = AccountService.create_user(@user_fixture)

    conn = get(conn, "/api/profiles/#{profile.id}")

    response = json_response(conn, 200)

    assert response["id"] == profile.id
  end

  test "PUT /api/profiles/:id", %{conn: conn} do
    {:ok, %{profile: profile}} = AccountService.create_user(@user_fixture)
    conn =
      put(conn, "/api/profiles/#{profile.id}", %{
        "profile" => %{
          "address" => "test",
          "avatar" => "test",
          "bio" => "test",
          "city" => "test",
          "country" => "test",
          "dob" => "2018-12-23",
          "mobile_number" => "test",
          "state" => "test",
          "zipcode" => "test"
        }
      })
    json_response(conn, 200)
  end
end
