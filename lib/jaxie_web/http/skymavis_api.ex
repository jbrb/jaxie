defmodule JaxieWeb.Http.SkymavisApi do
  use HTTPoison.Base
  alias Jaxie.Utils.Atomize

  @url "https://lunacia.skymavis.com/game-api"

  def process_request_url(url) do
    @url <> url
  end

  def process_response_body(body) do
    Jason.decode!(body, keys: &atoms/1)
  end

  defp atoms(key) do
    Atomize.string_to_atom(key)
  end
end
