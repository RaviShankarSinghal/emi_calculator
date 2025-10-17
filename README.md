# 💰 EmiCalculator

A lightweight Ruby gem for calculating **Loan EMIs**, **Total Interest**, and **Amortization Schedules** with ease.

---

## 🚀 Features

- 🧮 Calculate monthly EMI (Equated Monthly Installment)
- 💵 Get total payment and total interest
- 📅 Generate detailed amortization schedules
- 🧑‍💻 Easy to integrate with Rails or standalone Ruby projects
- ✅ Tested with RSpec

---

## 📦 Installation

Add this line to your application's Gemfile:

```ruby
gem 'emi_calculator'
Then execute

$ bundle install

Or Install Directly

$ gem install emi_calculator


require 'emi_calculator'

calculator = EmiCalculator::Calculator.new(
  principal: 500_000,      # Loan amount
  annual_rate: 10,         # Annual interest rate (in %)
  tenure_months: 60        # Loan period in months
)

calculator.emi
# => 10624.45


calculator.total_payment
# => 637467.0

calculator.total_interest
# => 137467.0


schedule = calculator.amortization_schedule

schedule.first(3)
# => [
#   {:month=>1, :emi=>10624.45, :interest=>4166.67, :principal=>6457.78, :balance=>493542.22},
#   {:month=>2, :emi=>10624.45, :interest=>4112.85, :principal=>6511.60, :balance=>487030.62},
#   {:month=>3, :emi=>10624.45, :interest=>4058.59, :principal=>6565.86, :balance=>480464.76}
# ]


$ bundle install
$ rspec


🧰 Development

Run the following to set up your local environment:

$ bin/setup


You can open an interactive console with:

$ bin/console


To install this gem locally:

$ bundle exec rake install


To release a new version:

$ bundle exec rake release


This will:

Build the .gem file

Create a new Git tag

Push commits and the tag

Publish the gem to RubyGems.org

📘 Example Project
# example.rb
require 'emi_calculator'

loan = EmiCalculator::Calculator.new(
  principal: 250000,
  annual_rate: 8.5,
  tenure_months: 36
)

puts "Monthly EMI: ₹#{loan.emi}"
puts "Total Payment: ₹#{loan.total_payment}"
puts "Total Interest: ₹#{loan.total_interest}"

🤝 Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/<your-username>/emi_calculator
.

Fork it

Create your feature branch (git checkout -b my-new-feature)

Commit your changes (git commit -am 'Add new feature')

Push to the branch (git push origin my-new-feature)

Create a new Pull Request

🧑‍💼 Author

Ravi Shankar Singhal
Senior Backend Developer — Ruby on Rails
📧 ravi.singhal2308@gmail.com

🌐 https://github.com/RaviShankarSinghal

🪪 License

The gem is available as open source under the terms of the MIT License
.
---
