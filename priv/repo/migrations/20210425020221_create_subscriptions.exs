defmodule Gymex.Repo.Migrations.CreateSubscriptions do
  use Ecto.Migration

  def change do
    create table(:subscriptions) do
      add :interval, :integer
      add :expires_at, :date
      add :suspended_at, :date
      add :status, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :package_id, references(:packages, on_delete: :nothing)
      add :service_id, references(:services, on_delete: :nothing)
      add :cycle_id, references(:cycles, on_delete: :nothing)

      timestamps()
    end

    create index(:subscriptions, [:user_id])
    create index(:subscriptions, [:package_id])
    create index(:subscriptions, [:service_id])
    create index(:subscriptions, [:cycle_id])
  end
end
