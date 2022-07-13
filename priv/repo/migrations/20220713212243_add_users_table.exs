defmodule Exmeal.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:email, :string)
      add(:cpf, :string)
      add(:name, :string)

      timestamps()
    end
  end
end
