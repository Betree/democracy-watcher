# Author::    Benjamin Piouffle
# License::   MIT

class PromiseSubject < ActiveRecord::Base
  enum        category: [:culture, :economy, :environment, :government, :immigration, :security, :education, :others]

  validates   :category, presence: true

  def name
    category = I18n.t("activerecord.models.promise_subject.category.#{self.category}")
    title = self.title ? self.title : I18n.t('others')
    "#{category} - #{title}"
  end

  rails_admin do
    field :category do
      pretty_value do
        I18n.t("activerecord.models.promise_subject.category.#{value}")
      end
    end
    field :title
  end
end
