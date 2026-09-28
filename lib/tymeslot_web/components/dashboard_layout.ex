defmodule TymeslotWeb.Components.DashboardLayout do
  @moduledoc """
  Shared layout component for all dashboard pages.
  Provides consistent navigation, styling, and user interface elements.
  """
  use TymeslotWeb, :html
  use Gettext, backend: TymeslotWeb.Gettext

  alias Phoenix.LiveView.JS
  alias TymeslotWeb.Components.DashboardSidebar
  alias TymeslotWeb.Components.UserDropdownComponent

  @doc """
  Renders the main dashboard layout with left sidebar and top navigation.
  """
  attr :current_user, :any, required: true
  attr :profile, :any, required: true
  attr :current_action, :atom, required: true
  attr :integration_status, :map, default: %{}
  attr :automations_allowed, :boolean, default: true
  attr :analytics_allowed, :boolean, default: true
  attr :full_width, :boolean, default: false
  attr :sidebar_extensions, :list, default: []
  attr :unseen_announcements, :list, default: []
  slot :inner_block, required: true

  @spec dashboard_layout(map()) :: Phoenix.LiveView.Rendered.t()
  def dashboard_layout(assigns) do
    ~H"""
    <div
      class="flex flex-col h-screen overflow-hidden"
      id="dashboard-root"
      phx-hook="ClipboardCopy"
    >
      <%!-- Feature-announcement carousel. Renders nothing when the list is empty. --%>
      <.live_component
        :if={@unseen_announcements != []}
        module={TymeslotWeb.Components.AnnouncementModalComponent}
        id="announcement-modal"
        announcements={@unseen_announcements}
        current_user={@current_user}
      />

      <%!-- Top Navigation --%>
      <div class="shrink-0">
        <.top_navigation current_user={@current_user} profile={@profile} />
      </div>

      <%!-- Main Layout Area --%>
      <div class="flex lg:gap-8 flex-1 overflow-hidden min-h-0">
        <DashboardSidebar.sidebar
          current_action={@current_action}
          integration_status={@integration_status}
          profile={@profile}
          automations_allowed={@automations_allowed}
          analytics_allowed={@analytics_allowed}
          sidebar_extensions={@sidebar_extensions}
        />

        <%!-- Main Content Area --%>
        <div
          id="dashboard-content-container"
          class={[
            "flex-1 min-w-0 w-full lg:ml-0",
            if(@full_width, do: "flex flex-col overflow-hidden", else: "overflow-y-auto")
          ]}
          phx-hook="ScrollReset"
          data-action={@current_action}
        >
          <%= if @full_width do %>
            <main class="flex-1 flex flex-col min-h-0">{render_slot(@inner_block)}</main>
          <% else %>
            <div class="max-w-7xl mx-auto px-4 lg:px-8 pb-8">
              <main>{render_slot(@inner_block)}</main>
            </div>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  @doc """
  Renders the Holedo Cal product navigation.
  """
  attr :current_user, :any, required: true
  attr :profile, :any, required: true
  attr :show_sidebar_toggle, :boolean, default: true

  @spec top_navigation(map()) :: Phoenix.LiveView.Rendered.t()
  def top_navigation(assigns) do
    ~H"""
    <header class="holedo-product-nav">
      <div class="holedo-product-nav__inner">
        <div class="holedo-product-nav__left">
          <button
            :if={@show_sidebar_toggle}
            class="lg:hidden holedo-product-nav__menu"
            phx-click={
              JS.toggle_class("dashboard-sidebar-open", to: "#dashboard-sidebar")
              |> JS.toggle_class("hidden", to: "#dashboard-sidebar-overlay")
            }
            aria-label={dgettext("dashboard_common", "Toggle sidebar")}
          >
            <.icon name="hero-bars-3" class="w-5 h-5" />
          </button>

          <.link navigate={~p"/dashboard"} class="holedo-product-brand">
            <img
              src={~p"/images/holedo/holedo-icon-dark.svg"}
              alt="Holedo"
              class="holedo-product-brand__logo"
            />
            <span class="holedo-product-brand__name">Calendar</span>
          </.link>
        </div>

        <div class="holedo-product-nav__right">
          <.live_component
            module={UserDropdownComponent}
            id="user-dropdown"
            current_user={@current_user}
            profile={@profile}
          />
        </div>
      </div>
    </header>
    """
  end
end
