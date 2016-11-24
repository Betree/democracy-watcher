# Author::    Benjamin Piouffle
# License::   MIT
# Defines a ruling entity

class RulingEntity < ActiveRecord::Base
  belongs_to  :group
  belongs_to  :leader, class_name: Leader
  has_many    :promises, :dependent => :delete_all

  eager_load [:leader, :group]

  mount_uploader :banner, RulingEntityBannerUploader

  # Get the ruling entity for a given +date+
  def self.for_date (date)
    where('mandate_start <= ?', date).where('mandate_end >= ?', date)
  end

  def is_current
    Date.current.between? mandate_start, mandate_end
  end

  # Generate the best name we can using leader and entity names
  def name
    if self.group and self.leader
      I18n.t(:group_description, group: self.group.name, leader: self.leader.name)
    elsif self.group
      self.group.name
    elsif self.leader
      self.leader.name
    else
      self.id.to_s
    end
  end

  # Similar to name but in a more compact way "Leader (Group)". Doesn't require translation
  def short_name
    if self.group and self.leader
      "#{self.leader.name} (#{self.group.name})"
    elsif self.group
      self.group.name
    elsif self.leader
      self.leader.name
    else
      self.id.to_s
    end
  end

  # Overrides default as_json to always includes group, leader and generated name in details
  def as_json(options)
    json = super(:include => [:group, :leader])
    json[:name] = self.name
    json[:short_name] = self.short_name
    json[:is_current] = self.is_current
    json
  end
end
