defmodule PhoenixApp.User do
  use PhoenixApp.Web, :model

  schema "users" do
    field :email, :string
    field :encrypted_password, :string
    many_to_many :projects, PhoenixApp.Project, join_through: "projects_users"
    has_many :lists, through: [:projects, :lists]
    has_many :items, through: [:lists, :items]

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :encrypted_password])
    |> validate_required([:email, :encrypted_password])
    |> unique_constraint(:email)
  end
end
