defmodule OrderTime.TradeTest do
  use OrderTime.DataCase

  alias OrderTime.Trade

  describe "orders" do
    alias OrderTime.Trade.Order

    @valid_attrs %{placing_time: "2010-04-17T14:00:00Z"}
    @update_attrs %{placing_time: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{placing_time: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Trade.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Trade.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Trade.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Trade.create_order(@valid_attrs)
      assert order.placing_time == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trade.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Trade.update_order(order, @update_attrs)
      assert order.placing_time == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Trade.update_order(order, @invalid_attrs)
      assert order == Trade.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Trade.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Trade.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Trade.change_order(order)
    end
  end
end
