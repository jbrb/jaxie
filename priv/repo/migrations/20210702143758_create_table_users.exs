defmodule Jaxie.Repo.Migrations.CreateTableUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :encrypted_password, :text
      add :role, :string
      add :ronin_address, :string

      timestamps()
    end
  end
end
