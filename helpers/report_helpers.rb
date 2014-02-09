module MyExpenses
  module ReportHelpers
    def no_categories(categories)
      "Please select at least one category." if !categories
    end

    def no_dates(start_date, end_date)
      "Please select both start and end date." if start_date.empty? or end_date.empty?
    end

    def no_valid_range(start_date, end_date)
      if string_to_date(start_date)..string_to_date(end_date)
        "The start date should be before the end date."
      end
    end
  end
end
