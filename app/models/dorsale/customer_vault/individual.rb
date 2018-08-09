class Dorsale::CustomerVault::Individual < Dorsale::CustomerVault::Person
  validates :first_name, presence: true
  validates :last_name,  presence: true

  def name
    [self.last_name, self.first_name].join(", ")
  end

  private def corporation_name;  raise NoMethodError; end
  private def corporation_name=; raise NoMethodError; end
end
