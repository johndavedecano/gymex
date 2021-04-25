defmodule Gymex.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :name, :string
      add :description, :text
      add :is_deleted, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:services, [:name])
  end
end
