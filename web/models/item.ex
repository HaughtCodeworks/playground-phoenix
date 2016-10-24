defmodule PhoenixApp.Item do
  use PhoenixApp.Web, :model

  schema "items" do
    field :description, :string
    belongs_to :list, PhoenixApp.List
    has_one :status, through: [:list, :status]

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description])
    |> validate_required([:description])
  end
end
