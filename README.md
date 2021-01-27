# Nearest Chapter

Create a function that returns which chapter is nearest to the page you're on.
If two chapters are equidistant, return the chapter with the higher page
number.

## Examples

```elixir
nearestChapter(%{
  "Chapter 1" => 1,
  "Chapter 2" => 15,
  "Chapter 3" => 37
}, 10) # => "Chapter 2"
```
 
 ```elixir
nearestChapter(%{
  "New Beginnings" => 1,
  "Strange Developments" => 62,
  "The End?" => 194,
  "The True Ending" => 460
}, 200) # => "The End?"
```
 
```elixir
nearestChapter(%{
  "Chapter 1a" => 1,
  "Chapter 1b" => 5
}, 3) # => "Chapter 1b"
```

## Notes

All page numbers in the dictionary will be valid integers.

See `NearestChapter` for doctests.
