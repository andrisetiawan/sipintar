defmodule Sipintar.Telegram.MessageBuilder do
  def generate_reply(message, from) do
    "hi, " <> from["first_name"] <> " kamu nulis: " <> message
  end
end
