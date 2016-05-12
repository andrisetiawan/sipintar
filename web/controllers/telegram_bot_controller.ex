defmodule Sipintar.TelegramBotController do
  alias Sipintar.Telegram.Handler
  use Sipintar.Web, :controller

  def webhook(conn, params) do
    Handler.handle(params)
    render(conn, "webhook.json")
  end
end
