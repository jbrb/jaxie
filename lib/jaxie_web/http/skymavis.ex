defmodule JaxieWeb.Http.Skymavis do
  alias JaxieWeb.Http.SkymavisApi

  def get_claimables(ronin_address) do
    case parse_ronin_address(ronin_address) do
      {:ok, address} ->
        get_address_data(address)

      {:error, :invalid_address} ->
        {:error, %{message: "Invalid address."}}
    end
  end

  def get_address_data(address) do
    case SkymavisApi.get("/clients/#{address}/items/1") do
      {:ok, %{body: body}} ->
        {:ok, body}

      {:error, _body} ->
        {:error, %{message: "Error fetching data."}}
    end
  end

  defp parse_ronin_address("0x" <> _ = address), do: {:ok, address}
  defp parse_ronin_address("ronin:" <> address), do: {:ok, "0x" <> address}
  defp parse_ronin_address(_), do: {:error, :invalid_address}
end
