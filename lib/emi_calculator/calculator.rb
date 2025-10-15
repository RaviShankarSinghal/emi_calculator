module EmiCalculator
  module Calculator
    attr_reader :principal, :annual_rate, :tenure_months

    def initialize(principal, annual_rate, tenure_months)
      @principal = principal.to_f
      @annual_rate = annual_rate.to_f
      @tenure_months = tenure_months.to_i
    end

    def monthly_rate
      annual_rate/ 12/ 100
    end

    def emi
      r = monthly_rate
      n = tenure_months
      p = principal

      return 0 if r.zero?

      p * r * ((1+r)**n) / ((1+r)**n - 1)
    end

    def total_payment
      emi * tenure_months
    end

    def total_interest
      total_payment - principal
    end

    def amortization_schedule
      schedule = []
      balance = principal
      r = monthly_rate
      (1..tenure_months).each do |month|
        interest = balance * r
        principal_component = emi - interest
        balance -= principal_component
        schedule << {
          month: month,
          emi: emi.round(3),
          interest: interest.round(3),
          principal: principal_component.round(3),
          balance: balance.positive? ? balance.round(3) : 0.000
        }
      end
      schedule
    end
  end
end
