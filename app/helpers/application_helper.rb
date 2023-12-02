module ApplicationHelper
 # render_ifメソッド(部分テンプレートの条件分岐用)
  def render_if(condition, *args)
    if condition
      render(*args)
    end
  end

  def color_by_score(score)
    if score >= 0.25 && score <= 1.0
      "#008000" #緑
    elsif score >= -0.25 && score <= 0.25
      "#ffd700" #黄色
    elsif score >= -1.0 && score <= -0.25
      "#b22222" #赤
    else
      "default"
    end
  end

end
