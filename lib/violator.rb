require './lib/violation'
require 'csv'

class Violator
  attr_reader :violations

  def initialize
    @violations = []
  end

  def import(file)
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      @violations << Violation.new(id: row[:violation_id],
                                  insepction_id: row[:inspection_id],
                                  category: row[:violation_category],
                                  date: row[:violation_date],
                                  date_closed: row[:violation_date_closed],
                                  type: row[:violation_typ])
    end
  end

  def categories
    @violations.map do |violation|
      violation.category
    end.uniq
  end

  def sort_by_date(category)
    @violations.select do |violation|
      violation.category.downcase == category.downcase
    end.sort_by do |violation|
      violation.date
    end
  end
end
