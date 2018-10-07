defmodule Keyboard.Factory do
  use ExMachina.Ecto, repo: Keyboard.Repo
  use Keyboard.KeyboardFactory
end
