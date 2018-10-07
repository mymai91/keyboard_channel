defmodule Keyboard.Manage do
  @moduledoc """
  The Manage context.
  """

  import Ecto.Query, warn: false
  alias Keyboard.Repo

  alias Keyboard.Manage.Keyboard

  def list_keyboards do
    Repo.all(Keyboard)
  end

  def get_keyboard!(id), do: Repo.get!(Keyboard, id)

  def get_keyboard(%{id: id}), do: Repo.get_by(Keyboard, id: id)

  def create_keyboard(attrs \\ %{}) do
    %Keyboard{}
    |> Keyboard.changeset(attrs)
    |> Repo.insert()
  end

  def update_keyboard(%Keyboard{} = keyboard, attrs) do
    keyboard
    |> Keyboard.changeset(attrs)
    |> Repo.update()
  end

  def delete_keyboard(%Keyboard{} = keyboard) do
    Repo.delete(keyboard)
  end


  def change_keyboard(%Keyboard{} = keyboard) do
    Keyboard.changeset(keyboard, %{})
  end
end
