class Role
  attr_accessor :name, :value

  def initialize(attrs)
    attrs.each {|attr, value| self.send("#{attr}=".to_sym, value)}
  end
end
