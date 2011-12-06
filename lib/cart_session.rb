class CartSession
  attr_reader :types, :valid, :total_price
private
  def initialize(session)
    @types = []
    @valid = session[:goods].present?
    if @valid
      generate_types(session)
      @total_price = generate_price
    end
  end

  def generate_types(session)
    session[:goods].each do |type|
      @types << ItemType.new(type[0], type[1]) if type[1].present?
    end
  end

  def generate_price
    @types.inject([]){|sum, type| sum + type.items}.inject(0){|sum, item| sum + item[:price]}
  end

  class ItemType
    attr_reader :name, :items
  private
    def initialize(type_name, items_data)
      @name = type_name
      @items = []

      items_data.each do |product|
        item = @name.to_s.camelize.constantize.find_by_id(product[0])
        quantity = product[1]
        @items << {:item => item, :quantity => quantity, :price => item.price * quantity} if item
      end
    end
  end
end

