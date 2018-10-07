defmodule Keyboard.ManageTest do
  use Keyboard.DataCase

  alias Keyboard.Manage

  describe "keyboards" do
    alias Keyboard.Manage.Keyboard

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

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

    test "create_keyboard/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manage.create_keyboard(@invalid_attrs)
    end

    test "update_keyboard/2 with valid data updates the keyboard" do
      keyboard = insert(:keyboard)
      assert {:ok, keyboard} = Manage.update_keyboard(keyboard, @update_attrs)
      assert %Keyboard{} = keyboard
    end

    test "update_keyboard/2 with invalid data returns error changeset" do
      keyboard = insert(:keyboard)
      assert {:error, %Ecto.Changeset{}} = Manage.update_keyboard(keyboard, @invalid_attrs)
      assert keyboard == Manage.get_keyboard!(keyboard.id)
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
