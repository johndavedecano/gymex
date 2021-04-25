defmodule Gymex.Business.Subscription do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subscriptions" do
    field :expires_at, :date
    field :interval, :integer
    field :status, :string
    field :suspended_at, :date
    belongs_to :user, Gymex.Account.User
    belongs_to :package, Gymex.Business.Package
    belongs_to :service, Gymex.Business.Service
    belongs_to :cycle, Gymex.Business.Cycle
    timestamps()
  end

  @doc false
  def changeset(subscription, attrs) do
    subscription
    |> cast(attrs, [:interval, :expires_at, :suspended_at, :status])
    |> validate_required([:interval, :expires_at, :suspended_at, :status])
  end
end
