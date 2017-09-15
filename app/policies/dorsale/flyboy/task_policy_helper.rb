module Dorsale::Flyboy::TaskPolicyHelper
  POLICY_METHODS = [
    :list?,
    :export?,
    :create?,
    :read?,
    :comment?,
    :update?,
    :delete?,
    :complete?,
    :snooze?,
    :copy?,
  ]

  def create?
    return false if cannot_read_taskable?
    super
  end

  def complete?
    return false if task.done?
    super
  end

  def snooze?
    return false unless task.snoozer.snoozable?
    super
  end

  private

  def cannot_read_taskable?
    return false unless task.is_a?(::Dorsale::Flyboy::Task)
    return false unless task.taskable.present?

    ! policy(task.taskable).read?
  end
end
