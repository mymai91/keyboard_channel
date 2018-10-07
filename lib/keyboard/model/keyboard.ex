defmodule Keyboard.Manage.Keyboard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "keyboards" do
    field(:name, :string)
    field(:size, :string)
    field(:brand, :string)

    timestamps()
  end

  @valid_attrs [
    :name,
    :size,
    :brand
  ]

  @doc false
  def changeset(keyboard, attrs) do
    keyboard
    |> cast(attrs, @valid_attrs)
    |> validate_required([])
  end
end
