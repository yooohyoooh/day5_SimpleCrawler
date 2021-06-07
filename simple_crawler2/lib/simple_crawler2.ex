defmodule SimpleCrawler2 do
  def main do
    top = showURL("https://thewaggletraining.github.io/")
    showAll(top)
  end

  def showURL(url) do
    html = HTTPoison.get(url)
    {:ok, document} = Floki.parse_document(elem(html,1).body)
    document
      |> Floki.find("a")
      |> Floki.attribute("href")
  end

  def showAll(top) do
    for i <- top do
      if String.contains?(i, "https://thewaggletraining.github.io/") do
        showURL(i)
      end
    end
  end

  def getText(url) do
    html = HTTPoison.get(url)
    {:ok, document} = Floki.parse_document(elem(html,1).body)
    document
    |> Floki.find("html")
    |> Floki.text()
  end

end
