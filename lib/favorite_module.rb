# frozen_string_literal: true

module FavoriteModule
  def faved_by?(user_id)
    favorites.any? { |fave| fave.user_id == user_id }
  end
end
