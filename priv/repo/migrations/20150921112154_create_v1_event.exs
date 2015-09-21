defmodule Ssa.Repo.Migrations.CreateV1.Event do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :event_type, :string
      add :student_id, :integer
      add :class_id, :integer
      add :school_id, :integer
      add :district_id, :integer
      add :event_details, :map

      timestamps
    end

  end
end
