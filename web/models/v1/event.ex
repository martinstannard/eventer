defmodule Ssa.V1.Event do
  use Ssa.Web, :model

  schema "events" do
    field :event_type, :string
    field :student_id, :integer
    field :class_id, :integer
    field :school_id, :integer
    field :district_id, :integer
    field :event_details, :map

    timestamps
  end

  @required_fields ~w(event_type student_id)
  @optional_fields ~w(class_id school_id district_id event_details)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
