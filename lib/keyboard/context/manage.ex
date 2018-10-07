defmodule Keyboard.Manage do
  @moduledoc """
  The Manage context.
  """

  import Ecto.Query, warn: false
  alias Keyboard.Repo

  alias Keyboard.Manage.Keyboard

  @doc """
  Returns the list of keyboards.

  ## Examples

      iex> list_keyboards()
      [%Keyboard{}, ...]

  """
  def list_keyboards do
    Repo.all(Keyboard)
  end

  @doc """
  Gets a single keyboard.

  Raises `Ecto.NoResultsError` if the Keyboard does not exist.

  ## Examples

      iex> get_keyboard!(123)
      %Keyboard{}

      iex> get_keyboard!(456)
      ** (Ecto.NoResultsError)

  """
  def get_keyboard!(id), do: Repo.get!(Keyboard, id)

  def get_keyboard(%{id: id}), do: Repo.get_by(Keyboard, id: id)

  @doc """
  Creates a keyboard.

  ## Examples

      iex> create_keyboard(%{field: value})
      {:ok, %Keyboard{}}

      iex> create_keyboard(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_keyboard(attrs \\ %{}) do
    %Keyboard{}
    |> Keyboard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a keyboard.

  ## Examples

      iex> update_keyboard(keyboard, %{field: new_value})
      {:ok, %Keyboard{}}

      iex> update_keyboard(keyboard, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_keyboard(%Keyboard{} = keyboard, attrs) do
    keyboard
    |> Keyboard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Keyboard.

  ## Examples

      iex> delete_keyboard(keyboard)
      {:ok, %Keyboard{}}

      iex> delete_keyboard(keyboard)
      {:error, %Ecto.Changeset{}}

  """
  def delete_keyboard(%Keyboard{} = keyboard) do
    Repo.delete(keyboard)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking keyboard changes.

  ## Examples

      iex> change_keyboard(keyboard)
      %Ecto.Changeset{source: %Keyboard{}}

  """
  def change_keyboard(%Keyboard{} = keyboard) do
    Keyboard.changeset(keyboard, %{})
  end
end
