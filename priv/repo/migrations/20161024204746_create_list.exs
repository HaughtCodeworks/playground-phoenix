defmodule PhoenixApp.Repo.Migrations.CreateList do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add :name, :string
      add :slug, :string
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end
    create index(:lists, [:project_id])

  end
end
