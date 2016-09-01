module Dorsale
  module BillingMachine
    module AbilityHelper
      def define_dorsale_billing_machine_abilities
        can [:list, :create, :read, :update, :pay, :copy, :download, :email], ::Dorsale::BillingMachine::Invoice
        can [:list, :create, :read, :update, :delete, :copy, :download], ::Dorsale::BillingMachine::Quotation
        can [:index, :create, :update], Dorsale::BillingMachine::IdCard
        can [:index, :create, :update], Dorsale::BillingMachine::PaymentTerm
      end
    end
  end
end
