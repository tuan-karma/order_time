defmodule OrderTimeWeb.OrderView do
  use OrderTimeWeb, :view

  def now() do
    DateTime.utc_now() |> DateTime.truncate(:second)
  end
end
