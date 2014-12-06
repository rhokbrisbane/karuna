class GroupsController < InheritedResources::Base

  def index
    @groups = Group.all.order(:position)
  end

  def show
    @group = Group.find(params[:id])
  end

end

