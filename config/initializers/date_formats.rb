Date::DATE_FORMATS[:short_date] = -> (date) {
  month = date.strftime("%B").split("")
  month_abbr = month[0...3].join
  date.strftime(month_abbr + " #{date.day}, #{date.year}")
}
