defmodule Keyboard.ManageTest do
  use Keyboard.DataCase

  alias Keyboard.Manage
  import Keyboard.Factory

  describe "keyboards" do
    alias Keyboard.Manage.Keyboard

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{name: 124}

    def keyboard_fixture(attrs \\ %{}) do
      {:ok, keyboard} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manage.create_keyboard()

      keyboard
    end

    test "list_keyboards/0 returns all keyboards" do
      keyboard = insert(:keyboard)
      assert Manage.list_keyboards() == [keyboard]
    end

    test "get_keyboard!/1 returns the keyboard with given id" do
      keyboard = insert(:keyboard)
      assert Manage.get_keyboard!(keyboard.id) == keyboard
    end

    test "create_keyboard/1 with valid data creates a keyboard" do
      assert {:ok, %Keyboard{} = keyboard} = Manage.create_keyboard(@valid_attrs)
    end

    test "update_keyboard/2 with valid data updates the keyboard" do
      keyboard = insert(:keyboard)
      assert {:ok, %Keyboard{} = keyboard} = Manage.update_keyboard(keyboard, @update_attrs)
    end

    test "delete_keyboard/1 deletes the keyboard" do
      keyboard = insert(:keyboard)
      assert {:ok, %Keyboard{}} = Manage.delete_keyboard(keyboard)
      assert_raise Ecto.NoResultsError, fn -> Manage.get_keyboard!(keyboard.id) end
    end

    test "change_keyboard/1 returns a keyboard changeset" do
      keyboard = insert(:keyboard)
      assert %Ecto.Changeset{} = Manage.change_keyboard(keyboard)
    end
  end
end
