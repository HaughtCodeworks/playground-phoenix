defmodule PhoenixApp.Repo.Migrations.CreateStatus do
  use Ecto.Migration

  def change do
    create table(:statuses) do
      add :description, :string
      add :list_id, references(:lists, on_delete: :nothing)

      timestamps()
    end
    create index(:statuses, [:list_id])

  end
end
