defmodule KeyboardAppService do
  require Logger
  alias Keyboard.{Manage}

  def get_keyboard(%{id: id}) do
    Manage.get_keyboard(%{id: id})
  end

  def scan_keyboard(keyboard) do
    keyboard |> Map.take([:id, :name, :size])
  end

  def update_brand(%{id: id, brand: brand}) do
    {:ok, updated_keyboard} =
      Manage.get_keyboard!(id)
      |> Manage.update_keyboard(%{brand: brand})

    updated_keyboard |> Map.take([:id, :brand])
  end
end
