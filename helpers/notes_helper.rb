# -*- encoding: utf-8 -*-

def note(note)
  erb(:"shared/notes/_#{note}.html").gsub("\n", ' ')
end
