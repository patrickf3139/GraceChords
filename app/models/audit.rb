Audit = Audited.audit_class

class Audit
  UPDATE = "update"
  CREATE = "create"
  DESTROY = "destroy"
  VALID_ACTIONS = [UPDATE, CREATE, DESTROY].freeze

  scope :history, -> { reorder("created_at DESC") }

  def update?
    action == UPDATE
  end

  def create?
    action == CREATE
  end

  def destroy?
    action == DESTROY
  end

  def self.valid_action(action)
    VALID_ACTIONS.include?(action)
  end
end