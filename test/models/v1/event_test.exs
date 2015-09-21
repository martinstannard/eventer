defmodule Ssa.V1.EventTest do
  use Ssa.ModelCase

  alias Ssa.V1.Event

  @valid_attrs %{class_id: 42, district_id: 42, event_details: %{}, event_type: "some content", school_id: 42, student_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
