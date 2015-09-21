defmodule Ssa.V1.EventView do
  use Ssa.Web, :view

  def render("index.json", %{events: events}) do
    %{data: render_many(events, Ssa.V1.EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, Ssa.V1.EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      event_type: event.event_type,
      student_id: event.student_id,
      class_id: event.class_id,
      school_id: event.school_id,
      district_id: event.district_id,
      event_details: event.event_details}
  end
end
