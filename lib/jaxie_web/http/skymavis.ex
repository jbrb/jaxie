defmodule JaxieWeb.Http.Skymavis do
  @url "https://lunacia.skymavis.com/game-api/clients"

  def get_claimables(ronin_address) do
    case HTTPoison.get(@url <> "/0x#{ronin_address}/items/1") do
      {:error, _body} ->
        {:error, %{message: "Error fetching data."}}
      {:ok, %{body: body}} ->
        body = Jason.decode!(body, keys: :atoms)

        %{claimable: body.claimable_total, total: body.total}
    end
  end
end
