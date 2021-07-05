defmodule Jaxie.Repo.Migrations.CreateTableEarnings do
  use Ecto.Migration

  def change do
    create table(:earnings, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :total_slp, :integer
      add :earned_slp, :integer
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end


  end
end
