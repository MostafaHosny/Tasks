class Numeric
  @@currencies = { egp: 1.0,dollar: 7.15, euro: 9.26, yen: 0.068 }
 
  @@currencies.each do |currency, rate|
    define_method(currency) do
      self * rate
    end
 
    alias_method "#{currency}s".to_sym, currency
  end
 def convert_currency (options={})
from = @@currencies[(options[:from].to_s.chomp('s')).to_sym]
to = @@currencies[(options[:to].to_s.chomp('s')).to_sym]
rate=from/to
self*rate
 
 end
def self.add_currency(options={})

@@currencies.merge!(options)
end
end
