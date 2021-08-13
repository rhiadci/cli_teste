defmodule CliConversor.Styles.Styles do
  @spec reset :: <<_::24, _::_*8>>
  def reset() do
    IO.ANSI.reset()
  end
  def header_decoration(text) do
    IO.ANSI.light_cyan_background() <> IO.ANSI.black() <> text <> IO.ANSI.reset()
  end
  def header_text(text) do
    IO.ANSI.black_background() <> IO.ANSI.green() <> text <> IO.ANSI.reset()
  end
  def text_default(text) do
    IO.ANSI.cyan() <> text <> IO.ANSI.reset()
  end
  def text_hint(text) do
    IO.ANSI.light_green_background() <> IO.ANSI.black <> text <> IO.ANSI.reset()
  end
  def text_action(text) do
    IO.ANSI.yellow_background() <> IO.ANSI.black() <> text <> IO.ANSI.reset()
  end
  def text_coin(text) do
    IO.ANSI.green_background() <> IO.ANSI.black() <> text <> IO.ANSI.reset()
  end
  def text_menu_item(text) do
    IO.ANSI.cyan_background() <> IO.ANSI.black() <> text <> IO.ANSI.reset()
  end
  def text_selected_coin(text) do
    IO.ANSI.cyan_background() <> IO.ANSI.black() <> text <> IO.ANSI.reset()
  end
  def green(text) do
    IO.ANSI.green() <> text <> IO.ANSI.reset()
  end
  def red(text) do
    IO.ANSI.red() <> text <> IO.ANSI.reset()
  end
  def yellow(text) do
    IO.ANSI.yellow() <> text <> IO.ANSI.reset()
  end
end
