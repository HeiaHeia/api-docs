# -*- encoding: utf-8 -*-

module UrlHelper

  def path_params(path)
    path.scan(/{(\w+)}/).flatten
  end

end
