class Task < ActiveRecord::Base

  validates :task, :presence => true

  def self.done_tasks
    Task.where(:done => true)
  end

  def self.not_done_tasks
    Task.where(:done => false)
  end
end
