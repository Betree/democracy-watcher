# Author::    Benjamin Piouffle
# License::   MIT

class Promise < ActiveRecord::Base
  belongs_to  :ruling_party
  belongs_to  :subject, class_name: PromiseSubject
  has_many    :sources, :dependent => :delete_all

  enum        status:   [:not_yet_started, :in_progress, :done, :broken]

  validates   :status, presence: true
  validates   :subject, presence: true

  def self.categorized
    eager_load(:subject).all.group_by { |p| p.subject.category }
  end
end
