module PostsHelper
  # def display_likers(post)
  #   likes = post.likes.all
  #   return list_likers(likes) if likes.size <= 8
  #   count_likers(likes)
  # end
  #
  # private
  #
  # def list_likers
  #   user_names = []
  #   if post.like?.each do |liker|
  #       user_names.push(link_to liker.user_name, profile_path(user.user_name),
  #       class: 'user-name')
  #   end
  #     user_names.to_sentence.html_safe
  #   end
  # end
  #
  # def count_likers(likes)
  #   like_count = likes.size
  #   like_count.to_s + ' likes'
  # end
end
