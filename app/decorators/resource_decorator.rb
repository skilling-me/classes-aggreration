class ResourceDecorator < BaseDecorator
  def avg_rating
    avg = resource.reviews.average(:rating)
    if avg.nil?
      return "0.00"
    else
      return "%.2f" % avg
    end

  end

  def count_comments
    # Ideally it should be when :comment is not nil but....
    resource.reviews.count(:comment)
  end
end
