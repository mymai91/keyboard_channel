defmodule KeyboardWeb.KeyboardChannel do
  require Logger
  use KeyboardWeb, :channel

  def join("keyboard:" <> id, _payload, socket) do
    keyboard = KeyboardAppService.get_keyboard(%{id: id})
    get_keyboard(keyboard, socket)
  end

  def handle_in("update_brand", %{"id" => id, "brand" => brand}, socket) do
    keyboard = KeyboardAppService.update_brand(%{id: id, brand: brand})
    {:reply, {:ok, keyboard}, socket}
  end

  defp get_keyboard(keyboard, _socket) when is_nil(keyboard) do
    {:error, %{reason: "Keyboard Not Found"}}
  end

  defp get_keyboard(keyboard, socket) do
    result = KeyboardAppService.scan_keyboard(keyboard)
    {:ok, result, socket}
  end
end
