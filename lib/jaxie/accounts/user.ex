defmodule Jaxie.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :encrypted_password, :string
    field :role, :string
    field :ronin_address, :string

    timestamps()
  end

  def changeset(attrs) do
    cast(%__MODULE__{}, attrs, [:email, :first_name, :last_name, :role, :ronin_address])
  end
end
