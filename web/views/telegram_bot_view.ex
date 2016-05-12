defmodule Sipintar.TelegramBotView do
  use Sipintar.Web, :view

  def render("webhook.json", _params) do
    %{status: "ok"}
  end
end
