defmodule PhoenixApp.Repo.Migrations.CreateProject do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :slug, :string

      timestamps()
    end
    create unique_index(:projects, [:slug])

  end
end
