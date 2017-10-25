class Dorsale::BillingMachine::SmallData::FilterStrategyByPaymentStatus < ::Agilibox::SmallData::FilterStrategy
  def apply(query, value)
    table_name = query.model.table_name

    if value == "paid"
      query.where("#{table_name}.paid = ?", true)
    elsif value == "unpaid"
      query.where("#{table_name}.paid = ?", false)
    elsif value == "pending"
      query.where("#{table_name}.paid = ? and #{table_name}.due_date >= ?", false, Time.zone.now.to_date)
    elsif value == "late"
      query.where("#{table_name}.paid = ? and (#{table_name}.due_date < ? or #{table_name}.due_date is null)", false, Time.zone.now.to_date)
    else
      query
    end
  end
end
