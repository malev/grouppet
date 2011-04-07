class UserGroupsController < ApplicationController
  before_filter :authenticate  

  def index
    @columns = UserGroup.column_names
  end
end
