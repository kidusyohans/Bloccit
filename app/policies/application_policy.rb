class ApplicationPolicy
  class Scope
  attr_reader :user, :record, :scope
  

  def initialize(user, record, scope)
    @user = user
    @record = record
    @scope = scope
    
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && (record.user == user || user.admin?)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def scope
    record.class
  end

  def resolve
      scope
  end
    
    
  end
end
