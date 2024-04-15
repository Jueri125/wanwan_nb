module ApplicationHelper
  def review_path(review)
    if review.dog_run?
      public_dog_run_path(review)
    elsif review.dog_cafe?
      public_dog_cafe_path(review)
    elsif review.dog_hotel?
      public_dog_hotel_path(review)
    elsif review.dog_event?
      public_dog_event_path(review)
    end
  end
end
