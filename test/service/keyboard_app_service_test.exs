defmodule KeyboardAppServiceTest do
  use KeyboardWeb.ConnCase, async: true
  import Keyboard.Factory

  describe "Scanner App Service" do
    setup do
      keyboard = insert(:keyboard)

      {:ok, keyboard: keyboard}
    end

    test "get_keyboard/1 with valid id", %{keyboard: keyboard} do
      keyboard_data = KeyboardAppService.get_keyboard(%{id: keyboard.id})

      assert keyboard_data == keyboard
    end

    test "get_keyboard/1 with invalid id" do
      keyboard_data = KeyboardAppService.get_keyboard(%{id: 123456789})

      assert is_nil(keyboard_data)
    end

    test "scan_keyboard/1 return correct data", %{keyboard: keyboard} do
      scan_data = KeyboardAppService.scan_keyboard(keyboard)
      scan_data_key =
        scan_data
        |> Map.keys()
        |> Enum.sort()

      key_data_expect_return = [:id, :name, :size] |> Enum.sort()

      assert Enum.count(scan_data) == 3
      assert key_data_expect_return == scan_data_key
    end

    test "update_brand/1 return correct data", %{keyboard: keyboard} do
      new_brand = "silicon_jungles"
      update_data = KeyboardAppService.update_brand(%{id: keyboard.id, brand: new_brand})

      update_data_key =
        update_data
        |> Map.keys()
        |> Enum.sort()

      key_data_expect_return = [:id, :brand] |> Enum.sort()

      assert update_data.brand == new_brand
      assert Enum.count(update_data) == 2
      assert key_data_expect_return == update_data_key
    end
  end
end