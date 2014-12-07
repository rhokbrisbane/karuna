class GroupsController < InheritedResources::Base

  def index
    @groups = Group.all.order(:position)
  end

  def show
    @group = Group.find(params[:id])
    @next = Group.find_by_position(@group.position + 1)
    @prev = Group.find_by_position(@group.position - 1)
  end

end

