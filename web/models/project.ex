defmodule PhoenixApp.Project do
  use PhoenixApp.Web, :model

  schema "projects" do
    field :name, :string
    field :slug, :string
    field :rating, :float, virtual: true
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

  def validate_slug_contains_name(changeset) do
    slug = get_field(changeset, :slug)
    name = get_field(changeset, :name)
    if Regex.match?(~r[#{name}]i, slug) do
      changeset
    else
      add_error(changeset, :slug, "must contain '#{name}'")
    end
  end
end
