local function split_softbreak(elems)
  for i, el in ipairs(elems) do
    if el.t == "SoftBreak" then
      return {table.unpack(elems, 1, i)}, {table.unpack(elems, i + 1)}
    end
  end
  return elems, {}
end

function BlockQuote(elem)
  
  -- Get the first block of the blockquote
  local first_block = elem.content[1]
  if not first_block.t == "Para" then return nil end

  -- Split first block into title and start of content
  local before, after = split_softbreak(first_block.content)

  -- Get callout key and title from first block
  local first_str = pandoc.utils.stringify(before)
  local callout_key, title = first_str:match("^%[!(%a+)%]%s*(.-)%s*$")
  if not callout_key then return nil end

  if not title or title == "" then
    title = callout_key:lower():gsub("^%l", string.upper)
  end

  -- Get color and icon macros
  local key = callout_key:upper()
  local color_macro = "calloutColor" .. key
  local icon_macro = "\\calloutIcon" .. key

  -- Insert content into callout block
  local new_blocks = {}
  table.insert(new_blocks, pandoc.RawBlock("latex",
    string.format("\\begin{callout}{%s}{%s\\hspace{0.5em}%s}", color_macro, icon_macro, title)
  ))
  table.insert(new_blocks, after)
  for i = 2, #elem.content do
    table.insert(new_blocks, elem.content[i])
  end
  table.insert(new_blocks, pandoc.RawBlock("latex", "\\end{callout}"))

  return new_blocks
end
