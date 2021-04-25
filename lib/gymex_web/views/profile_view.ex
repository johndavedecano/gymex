defmodule GymexWeb.ProfileView do
  use GymexWeb, :view
  def render("profile.json", %{profile: profile}) do
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
end
