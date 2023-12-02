module ApplicationHelper
 # render_ifメソッド(部分テンプレートの条件分岐用)
  def render_if(condition, *args)
    if condition
      render(*args)
    end
  end

  def color_by_score(score)
    if score >= 0.25 && score <= 1.0
      "#008000" #緑　良い
    elsif score >= -0.25 && score <= 0.25
      "#ffd700" #黄色　良くない
    elsif score >= -1.0 && score <= -0.25
      "#b22222" #赤　悪い
    else
      "default"
    end
  end

# text_by_score　数値の結果で表示する文字を変える
  def text_by_score(score)
    if score >= 0.25 && score <= 1.0
      "良い" #良い
    elsif score >= -0.25 && score <= 0.25
      "普通" #普通
    elsif score >= -1.0 && score <= -0.25
      "悪い" #悪い
    else
      "-"
    end
  end
end
