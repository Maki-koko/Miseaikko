module ApplicationHelper
 # render_ifメソッド(部分テンプレートの条件分岐用)
  def render_if(condition, *args)
    if condition
      render(*args)
    end
  end

end
