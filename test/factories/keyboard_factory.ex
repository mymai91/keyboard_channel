defmodule Keyboard.KeyboardFactory do
  alias Keyboard.Manage.Keyboard

  defmacro __using__(_opts) do
    quote do
      def keyboard_factory do
        %Keyboard{
          name: "KeyboardName",
          brand: "Apple",
          size: "M"
        }
      end
    end
  end
end
