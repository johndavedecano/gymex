defmodule Gymex.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :dob, :date
      add :avatar, :string
      add :address, :string
      add :city, :string
      add :state, :string
      add :zipcode, :string
      add :country, :string
      add :bio, :string
      add :mobile_number, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:profiles, [:user_id])
  end
end
