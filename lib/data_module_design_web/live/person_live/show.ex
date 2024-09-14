defmodule DataModuleDesignWeb.PersonLive.Show do
  use DataModuleDesignWeb, :live_view

  alias DataModuleDesign.People

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:person, People.get_person!(id))
    }
  end

  defp page_title(:show), do: "Show Person"
  defp page_title(:edit), do: "Edit Person"
end
