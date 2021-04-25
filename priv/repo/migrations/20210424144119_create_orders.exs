defmodule OrderTime.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :placing_time, :utc_datetime #:naive_datetime

      timestamps()
    end

  end
end
