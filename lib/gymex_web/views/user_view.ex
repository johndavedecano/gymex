defmodule GymexWeb.UserView do
  use GymexWeb, :view

  def render("index.json", %{results: params}) do
    %{
        entries: render_many(params.entries, __MODULE__, "user.json"),
        meta: render_meta("meta.json", params)
    }
  end

  def render("user.json", %{user: user}) when user == %{} do
    %{}
  end

  def render("user.json", %{user: user}) when user != %{} do
    %{
      id: user.id,
      active: user.active,
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name,
      role: user.role,
      username: user.username,
      verified: user.verified,
      profile: render_profile("profile.json", user.profile),
      updated_at: user.updated_at,
      inserted_at: user.inserted_at
    }
  end
  
  def render_profile("profile.json", profile) do
    if Map.has_key?(profile, :id) do
      %{
        address: profile.address,
        avatar: profile.avatar,
        bio: profile.bio,
        city: profile.city,
        country: profile.country,
        dob: profile.dob,
        id: profile.id,
        mobile_number: profile.mobile_number,
        state: profile.state,
        updated_at: profile.updated_at,
        user_id: profile.user_id,
        zipcode: profile.zipcode
      }
    else
      %{}
    end
  end

  def render_meta("meta.json", page) do
    %{
      page_number: page.page_number,
      page_size: page.page_size,
      total_pages: page.total_pages,
      total_entries: page.total_entries
    }
  end

  def render("deleted.json", _) do
    %{message: "user has been deleted"}
  end
end
