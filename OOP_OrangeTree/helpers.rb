def pluralize(integer, string)
  integer == 1 ? "#{integer} #{string}" : "#{integer} #{string}s"
end
