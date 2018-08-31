class Company
  attr_reader :attributes

  def initialize(attributes={})
    @attributes = attributes
  end

  def to_hash
    {
      title: @attributes['name'],
      company_number: @attributes['number']
    }
  end
end
