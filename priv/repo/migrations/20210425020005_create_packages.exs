defmodule Gymex.Repo.Migrations.CreatePackages do
  use Ecto.Migration

  def change do
    create table(:packages) do
      add :amount, :decimal
      add :name, :string
      add :is_delete, :boolean, default: false, null: false
      add :service_id, references(:services, on_delete: :nothing)
      add :cycle_id, references(:cycles, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:packages, [:name])
    create index(:packages, [:service_id])
    create index(:packages, [:cycle_id])
  end
end
