defmodule Exmeal.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.Meal

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:cpf, :email, :name]

  @derive {Jason.Encoder, only: [:id] ++ @required_params}

  schema "users" do
    field(:cpf, :string)
    field(:email, :string)
    field(:name, :string)

    has_many(:meals, Meal, on_delete: :nilify_all)

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
