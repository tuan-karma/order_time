defmodule OrderTime.Trade.Order do
  use OrderTime.Schema
  import Ecto.Changeset

  schema "orders" do
    # , default: DateTime.utc_now() |> DateTime.truncate(:second)
    field :placing_time, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:placing_time])
    |> validate_required([:placing_time])
  end
end
