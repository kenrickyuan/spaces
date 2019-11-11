module ApplicationHelper
  def random_bg
    number = [1, 2, 3, 4, 5].sample
    asset_path("background/background-#{number}.png")
  end
end
