defmodule OrderTime.Schema do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema

      # Using UUIDs
      @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id

      # Using utc_datetime for schema's timestamps
      @timestamps_opts [type: :utc_datetime]
    end
  end
end
