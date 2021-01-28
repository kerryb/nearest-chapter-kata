defmodule NearestChapter do
  @doc """
  ## Examples

  These are executable doctests, as usual. Which is weird, because I almost
  never use them in production code.

  ```elixir
  iex> NearestChapter.find(%{
  ...>  "Chapter 1" => 1,
  ...>  "Chapter 2" => 15,
  ...>  "Chapter 3" => 37
  ...>}, 10)
  "Chapter 2"

  iex> NearestChapter.find(%{
  ...>  "New Beginnings" => 1,
  ...>  "Strange Developments" => 62,
  ...>  "The End?" => 194,
  ...>  "The True Ending" => 460
  ...> }, 200)
  "The End?"

  iex> NearestChapter.find(%{
  ...>  "Chapter 1a" => 1,
  ...>  "Chapter 1b" => 5
  ...> }, 3)
  "Chapter 1b"

  iex> NearestChapter.find(%{"Chapter 1a" => 1,
  ...>  "Chapter 1b" => 5,
  ...>  "Chapter 1c" => 50,
  ...>  "Chapter 1d" => 100
  ...> }, 75)
  "Chapter 1d"

  iex> NearestChapter.find(%{"Chapter 1a" => 1,
  ...>  "Chapter 1b" => 5,
  ...>  "Chapter 1c" => 50,
  ...>  "Chapter 1d" => 100,
  ...>  "Chapter 1e" => 200
  ...> }, 150)
  "Chapter 1e"

  iex> NearestChapter.find(%{"Chapter 1a" => 1,
  ...>  "Chapter 1b" => 5,
  ...>  "Chapter 1c" => 50,
  ...>  "Chapter 1d" => 100,
  ...>  "Chapter 1e" => 200
  ...> }, 74)
  "Chapter 1c"

  iex> NearestChapter.find(%{
  ...>  "Chapter 1a" => 1, 
  ...>  "Chapter 1b" => 5, 
  ...>  "Chapter 1c" => 50, 
  ...>  "Chapter 1d" => 100, 
  ...>  "Chapter 1e" => 200, 
  ...>  "Chapter 1f" => 400
  ...> }, 300)
  "Chapter 1f"
  ```
  """
  def find(chapters, page) do
    # sort by a tuple of <difference between page and chapter start> and
    # negative <chapter start>, so that ties are broken towards the larger page
    # number
    with {name, _start_page} <-
           Enum.min_by(chapters, fn {_name, start_page} ->
             {abs(start_page - page), -start_page}
           end) do
      name
    end
  end
end
