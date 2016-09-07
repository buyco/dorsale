module Dorsale
  module BillingMachine
    module AbilityHelper
      def define_dorsale_billing_machine_abilities
        can [:list, :create, :read, :update, :pay, :copy, :download, :email], ::Dorsale::BillingMachine::Invoice
        can [:list, :create, :read, :update, :delete, :copy, :download], ::Dorsale::BillingMachine::Quotation
        can [:list, :create, :update], Dorsale::BillingMachine::IdCard
        can [:list, :create, :update], Dorsale::BillingMachine::PaymentTerm

        cannot :pay, Dorsale::BillingMachine::Invoice do |invoice|
          invoice.paid?
        end
      end
    end
  end
end
