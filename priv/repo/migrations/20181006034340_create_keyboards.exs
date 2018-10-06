defmodule Keyboard.Repo.Migrations.CreateKeyboards do
  use Ecto.Migration

  def change do
    create table(:keyboards) do
      add(:name, :string)
      add(:size, :string)
      add(:brand, :string)

      timestamps()
    end

  end
end
