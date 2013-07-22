def note(note)
  erb(:"shared/notes/_#{note}.html").gsub("\n", ' ')
end
