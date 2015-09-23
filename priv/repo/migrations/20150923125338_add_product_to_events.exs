defmodule Ssa.Repo.Migrations.AddProductToEvents do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :product, :text
    end
  end
end
