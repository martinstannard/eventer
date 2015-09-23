defmodule Ssa.V1.EventController do
  use Ssa.Web, :controller

  alias Ssa.V1.Event

  #plug :scrub_params, "event" when action in [:create, :update]

  def index(conn, %{"from_date" => from_date, "to_date" => to_date}) do
    query = from e in Event,
          #where: e.inserted_at < ^Ecto.DateTime.from_date(from_date),
          where: e.inserted_at > ^Ecto.DateTime.from_date(elem(Ecto.Date.cast(from_date),1)),
          select: e
    
    events = Repo.all(query)
    render(conn, "index.json", events: events)
  end

  def index(conn, _params) do
    events = Repo.all(Event)
    render(conn, "index.json", events: events)
  end

  def create(conn, %{"event" => event_params}) do
    changeset = Event.changeset(%Event{}, event_params)

    case Repo.insert(changeset) do
      {:ok, event} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", event_path(conn, :show, event))
        |> render("show.json", event: event)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Ssa.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    event = Repo.get!(Event, id)
    render conn, "show.json", event: event
  end

  def update(conn, %{"id" => id, "event" => event_params}) do
    event = Repo.get!(Event, id)
    changeset = Event.changeset(event, event_params)

    case Repo.update(changeset) do
      {:ok, event} ->
        render(conn, "show.json", event: event)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Ssa.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Repo.get!(Event, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(event)

    send_resp(conn, :no_content, "")
  end
end
