module ApplicationHelper
  def alert_for(flash_type) {
    success: 'alert-success text-center',
    error:   'alert-danger text-center',
    alert:   'alert-warning text-center',
    notice:  'alert-info text-center'
  } [flash_type.to_sym] || flash_type.to_s
  end

  # Return the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'MEMESgram'
    if page_title.empty?
      base_title
    else
      "#{page_title} - #{base_title}"
    end
  end

  def form_image_select(post)
    if post.image_data?
      image_tag post.image_url(:medium), id: 'image-preview', class: 'img-responsive img-prew '
    else
      image_tag 'welcome.jpg', id: 'image-preview', class: 'img-responsive img-prew '
    end
  end

  def profile_avatar_select(user)
    if user.avatar_data?
      image_tag user.avatar_url(:medium), id: 'image-preview', class: 'img-responsive img-thumbnail rounded-circle profile-image'
    else
      image_tag 'default-avatar.png', id: 'image-preview', class: 'img-responsive img-thumbnail rounded-circle profile-image'
    end
  end
end
