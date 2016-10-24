defmodule PhoenixApp.Project do
  use PhoenixApp.Web, :model

  schema "projects" do
    field :name, :string
    field :slug, :string
    has_many :lists, PhoenixApp.List
    many_to_many :users, PhoenixApp.User, join_through: "projects_users"
    has_many :items, through: [:lists, :items]

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :slug])
    |> validate_required([:name, :slug])
    |> unique_constraint(:slug)
  end
end
