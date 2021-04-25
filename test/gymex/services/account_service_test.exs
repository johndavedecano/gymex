defmodule Gymex.AccountServiceTest do
  use Gymex.DataCase

  alias Gymex.Account.AccountService

  test "create_user" do
    fixture = %{
      first_name: "John Dave",
      last_name: "Decano",
      email: "johndavedecano@gmail.com",
      username: "johndavedecano",
      password: "password",
      role: "user",
      active: true,
      verified: true,
    }

    {:ok, results} = AccountService.create_user(fixture)

    assert fixture.first_name == results.first_name
    assert fixture.last_name == results.last_name
    assert fixture.email == results.email
    assert fixture.role == results.role
    assert fixture.verified == results.verified
    assert fixture.active == results.active
    assert results.id == results.profile.user_id
  end
end
