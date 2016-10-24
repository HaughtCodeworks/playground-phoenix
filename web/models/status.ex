defmodule PhoenixApp.Status do
  use PhoenixApp.Web, :model

  schema "statuses" do
    field :description, :string
    belongs_to :list, PhoenixApp.List

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
