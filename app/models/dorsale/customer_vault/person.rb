class Dorsale::CustomerVault::Person < ::Dorsale::ApplicationRecord
  self.table_name = "dorsale_customer_vault_people"

  extend Forwardable
  include ::Agilibox::Search
  include ::Dorsale::Users::Avatar

  def self.policy_class
    Dorsale::CustomerVault::PersonPolicy
  end

  after_initialize :verify_class

  def verify_class
    if self.class == ::Dorsale::CustomerVault::Person
      # self.abstract_class does not work with STI
      raise "Cannot directly instantiate Person class"
    end
  end

  has_many :comments, -> { order(created_at: :desc, id: :desc) }, class_name: ::Dorsale::Comment, as: :commentable, dependent: :destroy
  has_one :address, class_name: ::Dorsale::Address, as: :addressable, inverse_of: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true

  default_scope -> {
    order("LOWER(COALESCE(corporation_name, '') || COALESCE(last_name, '') || COALESCE(first_name, '')) ASC")
  }

  def person_type
    self.class.to_s.demodulize.downcase.to_sym
  end

  def corporation?
    person_type == :corporation
  end

  def individual?
    person_type == :individual
  end

  def tags_on(*args)
    super(*args).order(:name)
  end
end
