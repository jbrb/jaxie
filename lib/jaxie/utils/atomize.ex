defmodule Jaxie.Utils.Atomize do
  def string_to_atom(string) when is_binary(string) do
    String.to_existing_atom(string)
  rescue
    _ -> String.to_atom(string)
  end

  def atomize_keys(attrs) when is_map(attrs) do
    Map.new(attrs, fn {key, value} ->
      {string_to_atom(key), atomize_keys(value)}
    end)
  end

  def atomize_keys(attrs) when is_list(attrs) do
    Enum.map(attrs, fn attr ->
      atomize_keys(attr)
    end)
  end

  def atomize_keys(value), do: value
end
