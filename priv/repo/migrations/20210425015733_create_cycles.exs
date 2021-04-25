defmodule Gymex.Repo.Migrations.CreateCycles do
  use Ecto.Migration

  def change do
    create table(:cycles) do
      add :name, :string
      add :is_deleted, :boolean, default: false, null: false
      add :num_days, :integer
      add :description, :text

      timestamps()
    end

    create unique_index(:cycles, [:name])
  end
end
