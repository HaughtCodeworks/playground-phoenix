defmodule PhoenixApp.List do
  use PhoenixApp.Web, :model

  schema "lists" do
    field :name, :string
    field :slug, :string
    belongs_to :project, PhoenixApp.Project

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :slug])
    |> validate_required([:name, :slug])
  end
end
