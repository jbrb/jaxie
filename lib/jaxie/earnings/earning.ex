defmodule Jaxie.Earnings.Earning do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "earnings" do
    field :total_slp, :integer
    field :earned_slp, :integer

    belongs_to :user, Jaxie.Accounts.User

    timestamps()
  end

  def changeset(attrs) do
    cast(%__MODULE__{}, attrs, [:email, :first_name, :last_name, :role, :ronin_address])
  end
end
