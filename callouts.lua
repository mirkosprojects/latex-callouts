function BlockQuote(elem)
  local first_block = elem.content[1]
  
  if first_block.t == "Para" then
    local first_str = pandoc.utils.stringify(first_block.content)
    local callout_key, title = first_str:match("^%[!(%a+)%]%s*(.*)")

    if callout_key then
      local key = callout_key:upper()
      local color_macro = "calloutColor" .. key
      local icon_macro = "\\calloutIcon" .. key

      local new_blocks = {}
      table.insert(new_blocks, pandoc.RawBlock("latex",
        string.format("\\begin{callout}{%s}{%s\\hspace{0.5em}%s}", color_macro, icon_macro, title)
      ))
      for i = 2, #elem.content do
        table.insert(new_blocks, elem.content[i])
      end
      table.insert(new_blocks, pandoc.RawBlock("latex", "\\end{callout}"))

      return new_blocks
    end
  end
  return nil
end
