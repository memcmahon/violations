class Violation
  attr_reader :category, :date

  def initialize(attributes)
    @id = attributes[:id]
    @inspection_id = attributes[:inspection_id]
    @category = attributes[:category]
    @date = attributes[:date]
    @date_closed = attributes[:date_closed]
    @type = attributes[:type]
  end
end
