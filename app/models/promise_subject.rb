# Author::    Benjamin Piouffle
# License::   MIT

class PromiseSubject < ActiveRecord::Base
  enum        category: [:culture, :economy, :environment, :government, :immigration, :security, :education, :others]

  validates   :category, presence: true
end
