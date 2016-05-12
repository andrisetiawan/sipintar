defmodule Sipintar.Telegram.Handler do
  alias Sipintar.Telegram.MessageBuilder
  require Logger

  def handle(%{ "message" => message }) do
    MessageBuilder.generate_reply(message["text"], message["from"])
      |> send_reply_with_plain_message(message["chat"]["id"])
  end

  def handle(msg) do
    Logger.info "Unhandled message:\n#{inspect msg}"
  end

  defp send_reply_with_plain_message(message, chat_id) do
    if chat_id != nil do
      Logger.info "send_reply_with_plain_message to:\n#{chat_id} #{message}"
      Yocingo.send_message(chat_id, message, false, nil, %{ "force_reply" => false })
    end
  end
end

  # defp reply_with_rich_format_message do
    # Yocingo.send_message(82911682, "asfasdf ogitu",false,nil, %{ "force_reply" => false })
    # Yocingo.send_message(82911682, "ya atau ngga?", false, nil, %{ "keyboard" => [ [%{ "text" => "yes"}, %{ "text" => "no"}]], "one_time_keyboard" => true, "resize_keyboard" => true })
    # Yocingo.send_message(82911682, "ya atau ngga?", false, nil, %{ "keyboard" => [ [%{ "text" => "yes", "request_location" => true}, %{ "text" => "no"}]], "one_time_keyboard" => true, "resize_keyboard" => true })
    # Yocingo.send_message(82911682, "ya atau ngga?", false, nil, %{ "hide_keyboard" => true })
  # end

  # sample webhook POST params
  # %{
  #   "message" => %{
  #     "chat" => %{
  #       "first_name" => "Andri",
  #       "id" => 82911682,
  #       "last_name" => "Setiawan",
  #       "type" => "private",
  #       "username" => "andriset"
  #     },
  #     "date" => 1462851529,
  #     "from" => %{
  #       "first_name" => "Andri",
  #       "id" => 82911682,
  #       "last_name" => "Setiawan",
  #       "username" => "andriset"
  #     },
  #     "message_id" => 9,
  #     "text" => "adsfasf"
  #   },
  #   "update_id" => 949329732
  # }
