defmodule KeyboardWeb.KeyboardChannelTest do
  use Keyboard.DataCase
  use KeyboardWeb.ChannelCase, async: true
  alias KeyboardWeb.KeyboardChannel

  import Keyboard.Factory

  describe "Keyboard Channel" do
    setup do
      keyboard = insert(:keyboard)

      {:ok, scan_data, socket} =
        socket("", %{
          device_id: "iphone",
          device_name: "janyIphone"
        })
        |> subscribe_and_join(KeyboardChannel, "keyboard:#{keyboard.id}")

      {:ok, socket: socket, keyboard: keyboard, scan_data: scan_data}
    end

    test "join/3 keyboard channel return correct data", %{
      keyboard: keyboard,
      scan_data: scan_data
    } do
      assert Enum.count(scan_data) == 3
      data_key_return = [:id, :name, :size] |> Enum.sort()

      scan_data_key =
        scan_data
        |> Map.keys()
        |> Enum.sort()

      assert data_key_return == scan_data_key
    end

    test "join/3 with keyboard not found in db" do
      assert {:error, %{reason: "Keyboard Not Found"}} ==
               socket("", %{
                 device_id: "iphone",
                 device_name: "janyIphone"
               })
               |> subscribe_and_join(KeyboardChannel, "keyboard:123456")
    end

    test "update_brand return correct data", %{keyboard: keyboard, socket: socket} do
      ref = push(socket, "update_brand", %{id: keyboard.id, brand: "brand"})
      assert_reply(ref, :ok, %{id: _, brand: "brand"})
    end
  end
end
