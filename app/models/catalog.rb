class Catalog < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  def children
      Catalog.find_all_by_pid(self.name)
  end

  def parent
      parents = Catalog.first(:conditions =>  "name='#{self.pid}'")
  end

  def depth
    depth = 0
    tmp = self.parent;
    while tmp
      depth += 1
      tmp = tmp.parent
    end
    depth
  end

end
